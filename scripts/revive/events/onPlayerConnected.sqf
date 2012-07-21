/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: onPlayerConnected.sqf
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;

if (!isNil ("NMD_Rev_Data"+ _uid)) then {
	//_id publicVariableClient format["NMD_Rev_Data%1", _uid];
	publicVariable format["NMD_Rev_Data%1", _uid];
	["Sent JIP data for (" + _name + " - " + _uid + ")", 0] call NMD_rev_fnc_createLog;
};