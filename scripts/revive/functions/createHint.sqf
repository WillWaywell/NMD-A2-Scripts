/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: createHint.sqf
|	Args: <(int)type> [(any)args]
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

_type = _this select 0;

[] call bis_fnc_hints;
BIS_AdvHints_setDefaults;
BIS_AdvHints_THeader =  "=NMD= ACE Revive";

switch (_type) do
{
	case 0: 
	{
		BIS_AdvHints_TInfo = format["You have %1 lives out of %2.", player getVariable "nmd_rev_lives", NMD_Rev_Lives];
		BIS_AdvHints_TAction = "";
		BIS_AdvHints_TBinds = "";
		BIS_AdvHints_Text = call BIS_AdvHints_formatText;
		BIS_AdvHints_Duration = 5;
		BIS_AdvHints_Seamless = true;
		BIS_AdvHints_Silent = true;
		BIS_AdvHints_CanSkip = false;
	};
};

[] spawn { call BIS_AdvHints_showHint; };