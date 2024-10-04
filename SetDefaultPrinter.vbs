const HKEY_CLASSES_ROOT = &H80000000
const HKEY_CURRENT_USER = &H80000001
const HKEY_LOCAL_MACHINE = &H80000002
const HKEY_USERS = &H80000003
const HKEY_CURRENT_CONFIG = &H80000005

strComputer = "."
 
Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" &_
 strComputer & "\root\default:StdRegProv")

strKeyPath = "SOFTWARE\streamedsecurity"
strValueName = "DefaultPrinterSet"
oReg.GetDWORDValue HKEY_LOCAL_MACHINE,strKeyPath,strValueName,dwValue

if dwValue = 1 then 
	wscript.quit
End if

Dim objNetwork, strUNCPrinter, flag


flag = "C:\APPS\Flags\FollowMe.txt"

Set filesys = CreateObject("Scripting.FileSystemObject")

If not filesys.fileExists(flag) Then
	
	strUNCPrinter = "\\WinSpool2\_Follow-Me-BW"

	Set objNetwork = CreateObject("WScript.Network") 
	objNetwork.AddWindowsPrinterConnection strUNCPrinter
	objNetwork.SetDefaultPrinter strUNCPrinter

	'drop a flag so this only happens one time
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	
	If not filesys.FolderExists("c:\Apps\") then
		Set objFolder = objFSO.CreateFolder("C:\Apps")
	end if
	If not filesys.FolderExists("c:\Apps\flags\") then
		Set objFolder = objFSO.CreateFolder("C:\Apps\Flags")
	end if
	
	Set objFile = objFSO.CreateTextFile(flag)
	wscript.quit
end if

wscript.quit

 

