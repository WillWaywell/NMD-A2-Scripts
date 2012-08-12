/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: onPlayerWounded.sqf
|
|	Author: Nimrod
|	Email: nimrod@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

private ["_lives","_marker","_markerID"];

_lives = (player getVariable "nmd_rev_lives") - 1;
player setVariable ["nmd_rev_lives", _lives, true];

if ((player getVariable "nmd_rev_lives") < 0) exitWith 
{
	player setVariable ["ace_w_revive", 0];
};

[-1, { [1, _this] call NMD_rev_fnc_createHint }, (name player)] call CBA_fnc_globalExecute;

if (NMD_Rev_Markers) then 
{
	_markerID = format["nmd_revive_wounded_%1", name player];
	_marker = createMarker [_markerID, getPos player];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "hd_flag";
	_marker setMarkerText format["%1 is wounded", name player];
	_marker setMarkerColor "ColorRed";

	while { (player getVariable "ace_w_revive") > 0 } do 
	{
		_markerID setMarkerPos (getPos player);
		sleep 1;
	};
	
	deleteMarker _markerID;
}
else
{
	waitUntil { (player getVariable "ace_w_revive") <= 0 };
};

if (alive player) then
{
	sleep 2;
	[0] call NMD_rev_fnc_createHint;
};