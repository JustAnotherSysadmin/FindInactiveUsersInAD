#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         John Lucas

 Script Function:
	Show Maintenance directors who haven't logged in recently

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Constants.au3>
#include <MsgBoxConstants.au3>
;#include <EditConstants.au3>
;#include <GUIConstantsEx.au3>
;#include <StaticConstants.au3>
;#include <WindowsConstants.au3>

Func _GetDOSOutput($sCommand)
    Local $iPID, $sOutput = ""

    $iPID = Run('"' & @ComSpec & '" /c ' & $sCommand, "", @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
    While 1
        $sOutput &= StdoutRead($iPID, False, False)
        If @error Then
            ExitLoop
        EndIf
        Sleep(10)
    WEnd
    Return $sOutput
 EndFunc   ;==>_GetDOSOutput

Global $gListOfStuff = ""

$gListOfStuff &= ('List of inactive users:' & @CRLF)
$gListOfStuff &= (_GetDOSOutput('c:\windows\system32\dsquery.exe user "dc=example, dc=local" -inactive 2 -limit 200 -o rdn') & @CRLF)


;$gListOfStuff &= ('Maintenance Directors that have not logged into Windows in the past 2 weeks' & @CRLF)
;$gListOfStuff &= (_GetDOSOutput('dsquery user "dc=example, dc=local" -inactive 2 -limit 200 -o rdn | find "Maintenance"') & @CRLF)
;
;$gListOfStuff &= ('Maintenance Directors that have not logged into Windows in the past 4 weeks' & @CRLF)
;$gListOfStuff &= (_GetDOSOutput('dsquery user "dc=example, dc=local" -inactive 4 -limit 200 -o rdn | find "Maintenance"') & @CRLF)
;
;$gListOfStuff &= ('Maintenance Directors that have not logged into Windows in the past 6 months' & @CRLF)
;$gListOfStuff &= (_GetDOSOutput('dsquery user "dc=example, dc=local" -inactive 26 -limit 200 -o rdn | find "Maintenance"') & @CRLF)
;
;$gListOfStuff &= ('Maintenance Directors that have not logged into Windows in the past year:' & @CRLF)
;$gListOfStuff &= (_GetDOSOutput('dsquery user "dc=example, dc=local" -inactive 52 -limit 200 -o rdn | find "Maintenance"') & @CRLF)


$gListOfStuff &= (@CRLF & 'AutoIt Script:   FindInactiveUsersInAD_2017-02-16.au3' & @CRLF)
$gListOfStuff &= 'Written by John Lucas'


;$gListOfStuff &= (_GetDOSOutput("ping -n 1 127.0.0.1") & @CRLF)
;$gListOfStuff &= ("Red October?"  & @CRLF)

;MsgBox($MB_ICONWARNING, "example.com - Network Config", $gListOfStuff)
MsgBox($MB_ICONINFORMATION, "example.com - Maintenance Directors Inactive", $gListOfStuff)

