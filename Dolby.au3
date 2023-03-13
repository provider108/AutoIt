#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         https://github.com/provider108

 Script Function:
	Turns On/Off Dolby Digital Plus in Realtek High Definition Audio
	
(!) - weak place of the code

#ce ----------------------------------------------------------------------------

#include <GuiListView.au3>
#include <GuiTab.au3>

;~ Windows titles
$sSound = "Sound"
$sSpkrs = "Speakers Properties"

;~ Sound settings in Control panel
RunWait ( "control mmsys.cpl sounds" );
$hWndSound = WinWaitActive($sSound);

;~ Select list Item "Speakers" by index (!)
$hCtrlList = ControlGetHandle($hWndSound, "", "SysListView321");
$isListItemSelected = _GUICtrlListView_SetItemSelected($hCtrlList, 2) ;

;~ Open window "Speakers Properties" (!)
ControlClick($hWndSound, "", "Button3");

WinWait($sSpkrs)
If Not WinActive($sSpkrs) Then WinActivate($sSpkrs)
WinWaitActive($sSpkrs)

;~ Switch tab to "Dolby" by index (!)
$hCtrlTabs = ControlGetHandle($sSpkrs, "", "[CLASS:SysTabControl32; INSTANCE:1]")
_GUICtrlTab_ClickTab($hCtrlTabs, 3);

WinWait($sSpkrs)
If Not WinActive($sSpkrs) Then WinActivate($sSpkrs)
WinWaitActive($sSpkrs)

;~ Click the buttons "ON" ("OFF") of the tab "Dolby" and "OK" of the window "Speakers Properties"
ControlClick($sSpkrs, "", "Button1");
ControlClick($sSpkrs, "", "Button2");

;~ Close the window "Sound"
WinClose($hWndSound)
