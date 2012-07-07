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
["KILLED", 0] call NMD_rev_fnc_createLog;
ace_sys_spectator_exit_spectator = true;
ace_sys_spectator_ShownSides = nil;
ace_sys_spectator_maxDistance = nil;
ace_sys_spectator_CheckDist  = nil; 
ace_sys_spectator_CheckUncon = false;
ace_sys_spectator_no_butterfly_mode = true;
ace_sys_spectator_can_exit_spectator = false;
ace_sys_spectator_playable_only = true;

waituntil { alive player };

player SetVariable ["ace_sys_spectator_exclude", true, true];
player SetVariable ["ace_sys_wounds_uncon", true, true];

[player] joinSilent grpnull;

ace_sys_spectator_exit_spectator = nil;
ace_sys_spectator_RevButtons = nil;
ace_sys_spectator_RevShowButtonTime = nil;

[] spawn ace_fnc_startSpectator;
player setPos getMarkerPos "Boot_hill";
player setCaptive true;
player playMoveNow "AdthPercMstpSrasWrflDb_16";
player switchmove "AdthPercMstpSrasWrflDb_16";