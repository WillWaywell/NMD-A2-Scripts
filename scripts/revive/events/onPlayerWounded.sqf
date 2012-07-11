/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: onPlayerWounded.sqf
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

_lives = (player getVariable "nmd_rev_lives") - 1;
player setVariable ["nmd_rev_lives", _lives, true];

if ((player getVariable "nmd_rev_lives") < 0) exitWith 
{
	player setVariable ["ace_w_revive", 0];
};

['nmd_rev_hint', [1, name player]] call CBA_fnc_globalEvent;
[-1, { [1, _this] call NMD_rev_fnc_createHint }, (name player)] call CBA_fnc_globalExecute;

if (NMD_Rev_Markers) then 
{
	_marker = createMarker [format["nmd_revive_wounded_%1", name player], getPos player];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "hd_flag";
	_marker setMarkerText format["%1 is wounded", name player];
	_marker setMarkerColor "ColorRed";
};

waitUntil { (player getVariable "ace_w_revive") <= 0 };

if (NMD_Rev_Markers) then 
{
	deleteMarker format["nmd_revive_wounded_%1", name player];
};

if (alive player) then
{
	sleep 2;
	[0] call NMD_rev_fnc_createHint;
};