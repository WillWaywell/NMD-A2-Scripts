/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: revive.sqf
|	Init: execVM "revive\revive.sqf";
|
|	Author: Hawk
|	Email: hawk@nomandown.com
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

call compile preprocessFileLineNumbers 'revive\config.sqf';
ace_wounds_prevtime = NMD_Rev_Time;
ace_sys_wounds_withSpect = NMD_Rev_Spectator;
ace_sys_wounds_noai = NMD_Rev_NoAI;
ace_sys_wounds_no_medical_gear = true;

if (!isDedicated) then 
{
	waitUntil { !isNull player };
	waitUntil { local player };
	player setVariable ["nmd_rev_lives", NMD_Rev_Lives, true];
};

// Functions
NMD_rev_fnc_createLog			= compile preprocessFileLineNumbers "revive\functions\createLog.sqf";
NMD_rev_fnc_createHint			= compile preprocessFileLineNumbers "revive\functions\createHint.sqf";
NMD_rev_fnc_getPlayerData		= compile preprocessFileLineNumbers "revive\functions\getPlayerData.sqf";
NMD_rev_fnc_setPlayerData		= compile preprocessFileLineNumbers "revive\functions\setPlayerData.sqf";
NMD_rev_fnc_setPlayerLoadout	= compile preprocessFileLineNumbers "revive\functions\setPlayerLoadout.sqf";

if (isServer) then 
{
	onPlayerConnected "[_id, _name, _uid] execVM ""revive\events\onPlayerConnected.sqf""";
	onPlayerDisconnected "[_id, _name, _uid] execVM ""revive\events\onPlayerDisconnected.sqf""";
};

// Events
NMD_rev_fnc_onPlayerWounded = compile preprocessFileLineNumbers "revive\events\onPlayerWounded.sqf";
NMD_rev_fnc_onPlayerKilled = compile preprocessFileLineNumbers "revive\events\onPlayerKilled.sqf";

// CBA Events
["ace_sys_wounds_rev", { player spawn NMD_rev_fnc_onPlayerWounded }] call CBA_fnc_addEventhandler;
["ace_sys_wounds_rev2", { player spawn NMD_rev_fnc_onPlayerKilled }] call CBA_fnc_addEventhandler;

if (!isDedicated) then
{
	//NMD_Rev_Data6678854 = [[1000,1000,0], [false], -1, ["BAF_L85A2_UGL_ACOG"], ["ACE_30Rnd_556x45_T_Stanag"], "BAF_L85A2_UGL_SUSAT"];
	
	_pidDataVar = "NMD_Rev_Data"+ (getPlayerUID player);
	if (isNil (_pidDataVar)) then {
		[player] call NMD_rev_fnc_setPlayerLoadout;
	}
	else
	{
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
//ace_w_cardiactime
//ace_w_revive