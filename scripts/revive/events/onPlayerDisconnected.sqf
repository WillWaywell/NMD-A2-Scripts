/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: onPlayerDisconnected.sqf
|
|	Author: Nimrod
|	Email: nimrod@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;
_unit = objNull;

if(_name == "__SERVER__") exitWith {}; // Exit if Dedicated server is 'player'

deleteMarker "nmd_revive_wounded_" + _name;

{ if ((getPlayerUID _x) == _uid) exitwith { _unit = _x } } foreach playableUnits;
if ((isNull _unit)) exitWith {  ["Unable to find unit for player (" + _name + " - " + _uid + ")", 1] call NMD_rev_fnc_createLog };
if (!NMD_Rev_Persistent ||  !(_unit call ace_sys_wounds_fnc_isUncon)) exitWith {};

call compile format ["NMD_Rev_Data%1 = [_unit] call NMD_rev_fnc_getPlayerData;", _uid];
["Saved data for disconnected player (" + _name + " - " + _uid + ")", 0] call NMD_rev_fnc_createLog;