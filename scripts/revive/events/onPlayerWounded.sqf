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
["WOUNDED", 0] call NMD_rev_fnc_createLog;
_lives = (player getVariable "nmd_rev_lives") - 1;
player setVariable ["nmd_rev_lives", _lives, true];


if ((player getVariable "nmd_rev_lives") < 0) exitWith 
{
	player setVariable ["ace_w_revive", 0];
};

waitUntil { (player getVariable "ace_w_revive") <= 0 };
if (alive player) then
{
	[0] call NMD_rev_fnc_createHint;
};