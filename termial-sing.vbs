' termial-sing.vbs
' Written by Emil Stjerneman
' https://github.com/bratanon/terminal-sing
'
' Start the script from the terminal and give a lyric name as frist argument
' termial-sing.vbs lyricname

Dim strArg, xHttp

If Wscript.Arguments.Count < 1 Then
	Wscript.Echo "Yuo have to start from the terminal."
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