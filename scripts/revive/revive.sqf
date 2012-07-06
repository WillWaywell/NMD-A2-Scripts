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
player setVariable ["nmd_rev_lives", NMD_Rev_Lives];

// Functions
NMD_rev_fnc_getPlayerData 		= compile preprocessFileLineNumbers "revive\functions\getPlayerData.sqf";
NMD_rev_fnc_setPlayerData 		= compile preprocessFileLineNumbers "revive\functions\setPlayerData.sqf";
NMD_rev_fnc_setPlayerLoadout 	= compile preprocessFileLineNumbers "revive\functions\setPlayerLoadout.sqf";

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
	_pidDataVar = "NMD_Rev_Data"+ (getPlayerUID player);
	if (isNil (_pidDataVar)) then {
		diag_log["LOADOUT"];
		[player] call NMD_rev_fnc_setPlayerLoadout;
	}
	else
	{
		[player, _pidDataVar] call NMD_rev_fnc_setPlayerData;
	};
};

diag_log["NMD Revive: Initialized"];
//ace_w_cardiactime
//ace_w_revive
//NMD_Rev_Data6678854 = [[0,0,0], 2, ["BAF_L85A2_UGL_ACOG"], ["ACE_30Rnd_556x45_T_Stanag"], "BAF_L85A2_UGL_SUSAT"];