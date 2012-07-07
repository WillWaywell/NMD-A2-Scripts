/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: onPlayerKilled.sqf
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

waituntil { alive player };

player SetVariable ["ace_sys_spectator_exclude", true, true];
player SetVariable ["ace_sys_wounds_uncon", true, true];
[player, player, ""] spawn ace_fnc_startSpectator;
player setPos getMarkerPos "Boot_hill";
player setCaptive true;
player playMoveNow "AdthPercMstpSrasWrflDb_16";
player switchmove "AdthPercMstpSrasWrflDb_16";