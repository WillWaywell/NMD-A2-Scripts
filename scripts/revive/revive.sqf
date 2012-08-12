/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: revive.sqf
|	Init: execVM "scripts\revive\revive.sqf";
|
|	Author: Nimrod
|	Email: nimrod@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

waitUntil {!isNil "ace_sys_wounds"}; waitUntil {ace_sys_wounds};
if ((isNil "ace_sys_wounds_enabled")) exitWith
{
	diag_log["NMD Revive: ACE Wounds is disabled!"];
};

NMD_Rev_Enabled = true;
diag_log["NMD Revive: Initializing..."];

call compile preprocessFileLineNumbers 'scripts\revive\config.sqf';
[] call bis_fnc_hints;
ace_wounds_prevtime = NMD_Rev_Time;
if (NMD_Rev_Spectator) then 
{
	ace_sys_wounds_withSpect = true;
};
ace_sys_wounds_noai = NMD_Rev_NoAI;
ace_sys_wounds_no_rpunish = true;
ace_sys_wounds_no_medical_gear = true;

if (!isDedicated) then 
{
	waitUntil { !isNull player };
	waitUntil { local player };
	player setVariable ["nmd_rev_lives", NMD_Rev_Lives, true];
};

// Functions
NMD_rev_fnc_createLog			= compile preprocessFileLineNumbers "scripts\revive\functions\createLog.sqf";
NMD_rev_fnc_createHint			= compile preprocessFileLineNumbers "scripts\revive\functions\createHint.sqf";
NMD_rev_fnc_getPlayerData		= compile preprocessFileLineNumbers "scripts\revive\functions\getPlayerData.sqf";
NMD_rev_fnc_setPlayerData		= compile preprocessFileLineNumbers "scripts\revive\functions\setPlayerData.sqf";
NMD_rev_fnc_setPlayerLoadout	= compile preprocessFileLineNumbers "scripts\revive\functions\setPlayerLoadout.sqf";

if (isServer) then 
{
	onPlayerConnected "[_id, _name, _uid] call compile preprocessfilelinenumbers ""scripts\revive\events\onPlayerConnected.sqf""";
	onPlayerDisconnected "[_id, _name, _uid] call compile preprocessfilelinenumbers ""scripts\revive\events\onPlayerDisconnected.sqf""";
};

// Events
NMD_rev_fnc_onPlayerWounded = compile preprocessFileLineNumbers "scripts\revive\events\onPlayerWounded.sqf";
NMD_rev_fnc_onPlayerKilled = compile preprocessFileLineNumbers "scripts\revive\events\onPlayerKilled.sqf";

// CBA Events
["ace_sys_wounds_rev", { player spawn NMD_rev_fnc_onPlayerWounded }] call CBA_fnc_addEventhandler;
["ace_sys_wounds_rev2", { player spawn NMD_rev_fnc_onPlayerKilled }] call CBA_fnc_addEventhandler;

if (!isDedicated) then
{
	_pidDataVar = "NMD_Rev_Data"+ (getPlayerUID player);
	//diag_log[format["%1", call compile _pidDataVar]];
	if (isNil (_pidDataVar)) then {
		["NO PUBVAR", 0] call NMD_rev_fnc_createLog;
		[player] call NMD_rev_fnc_setPlayerLoadout;
	}
	else
	{
		["PUBVAR DETECTED (POTATOE)", 0] call NMD_rev_fnc_createLog;
		[player, call compile _pidDataVar] call NMD_rev_fnc_setPlayerData;
	};
	
};

["Initialized", 0] call NMD_rev_fnc_createLog;

waituntil{ time > 1 };

if ((player getVariable "nmd_rev_lives") < 0) then 
{
	call NMD_rev_fnc_onPlayerKilled;
}
else
{
	[0] call NMD_rev_fnc_createHint;
};