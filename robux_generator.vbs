
Dim username, robuxAmount, confirm
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
MsgBox "Authenticating user "" & username & ""...", vbInformation, "Processing"
WScript.Sleep 2000
MsgBox "Transferring " & robuxAmount & " Robux...", vbInformation, "Processing"
WScript.Sleep 3000
MsgBox "✅ Transfer successful! " & robuxAmount & " Robux added to " & username & "'s account!", vbInformation, "Success"
