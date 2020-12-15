'Written by Tyler Gerritsen 2020-12-15
'Run script in folder with videos to check synchronization of clapboard/tone
'Prerequisites: FFMPEG

'Vertical grid is 0.1 seconds per div

width = 640
border = 5
tt = 4
maxWaveforms = 12




workingDirectory = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)

Set fso = CreateObject("Scripting.FileSystemObject")
sFolder = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\"))
Set folder = fso.GetFolder(sFolder)
Set files = folder.Files
dim fileNames()
Set oShell = WScript.CreateObject ("WScript.Shell")
dim oFile
set fsoText = CreateObject("Scripting.FileSystemObject")
set oFile = fsoText.CreateTextFile(workingDirectory & "\checkWaveform.bat")


startIndex = 0
finished = false
thisOut = -1
while not finished
	numFiles = 0
	oString = "ffmpeg -y "
	thisStartIndex = startIndex
	thisOut = thisOut + 1
	finished = true
	For each folderIdx In files
	  fileName = folderIdx.name
	  if len(fileName) > 4 then
		if right(lcase(fileName),4) = ".mp4" and instr(filename, "waveform") < 1 then
			if thisStartIndex > 0 then
				thisStartIndex = thisStartIndex - 1
			elseif numFiles => maxWaveforms then
				finished = false
			else
				numFiles = numFiles + 1
				redim preserve fileNames(numFiles)
				fileNames(numFiles - 1) = filename
				oString = oString & "-t " & tt & " -i " & fileName & " "
			end if
		end if
	  end if
	Next

	oString = oString & "-filter_complex " & chr(34)

	for i = 0 to numFiles - 1
		thisChar = chr(65+cint(i/50)) & chr(65 + i - 25 * cint(i/50))
		oString = oString & "[" & i & "]showspectrum=s=" & width & "x100:mode=combined:color=intensity:saturation=5:slide=1:scale=cbrt,drawtext=x=10:y=10:fontcolor=white:fontsize=25:text='" & fileNames(i)  & "',format=yuv420p[" & thisChar & "];"
	next

	padSize = numFiles * 100
	if numFiles > 1 then oString = ostring & "[AA]pad=w=" & width & ":h="&padSize&"[top];"

	if numFiles > 1 then
		oString = oString & "[top][AB]overlay=y=100"
		for i = 2 to numFiles - 1
			thisChar = chr(65+cint(i/50)) & chr(65 + i - 25 * cint(i/50))
			oString = oString & "[" & thisChar & "C];[" & thisChar&"C][" & thisChar&"]overlay=y="& i * 100
		next
	end if
	oString = oString & "[last];[last]drawgrid=x=40:y=0:w=20:h=100"
	oString = oSTring & chr(34) & " -vcodec libx264 -x264-params keyint=1 -an waveform" & thisOut & ".mp4"
	oFile.writeLine(oString)
	startIndex = startIndex + maxWaveforms
wend

if thisOut > 0 then
	oString = "ffmpeg -y "
	for i = 0 to thisOut
		oString = oString & "-i waveform" & i & ".mp4 " 
	next
	oString = oString & " -filter_complex " & chr(34) & "[0]pad=w=" & thisOut * width + width & "[pad];[pad][1]overlay=x=" & width
	for i = 2 to thisOut
		oString = oString & "[" & chr(64+i) & "];[" & chr(64+i) & "][" & i & "]overlay=x=" & width * i
	next
	oString = oString & chr(34) & " -vcodec libx264 -x264-params keyint=1 -an waveform.mp4"
	oFile.writeLine(oString)
end if

for i = 0 to thisOut
	oFile.writeLine("del waveform" & i & ".mp4")
next

oFile.close

oShell.run(chr(34) & workingDirectory & "\checkWaveform.bat" & chr(34))