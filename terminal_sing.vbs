' terminal_sing.vbs
' Written by Emil Stjerneman (BratAnon)
' https://github.com/bratanon/terminal-sing
'
' Start the script from the terminal and give a lyric name as frist argument
' terminal_sing.vbs lyricname

Dim xHttp

If Wscript.Arguments.Count < 1 Then
	Wscript.Echo "You have to start from the terminal."
	Wscript.Quit
End If

Set ObjVoice = CreateObject("SAPI.SpVoice")
Set xHttp = createobject("Microsoft.XMLHTTP")

ReadContent( Wscript.Arguments(0) )

Sub ReadContent( strLyric )
	xHttp.Open "GET", "https://raw.githubusercontent.com/bratanon/terminal-sing/master/lyrics/" & strLyric & ".lyric", False
	xHttp.Send

	If xHttp.Status = 200 Then
		ObjVoice.Speak xHttp.responseText
	Else
		ObjVoice.Speak "I can not find that song."
	End If
End Sub
