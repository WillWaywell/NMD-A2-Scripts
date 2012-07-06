/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: onPlayerDisconnected.sqf
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

if(!isServer) exitwith {};

_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;
_unit = objnull;

if(_name == (name player)) exitWith {}; // Exit if Dedicated server is 'player'

{  if ((name _x) == _name) exitwith { _unit = _x }; } foreach allUnits;
if ((isNull _unit)) exitWith { diag_log[format["NMD Revive: Unable to find unit for: %1 - %2", _name, _uid]]; };
if (_unit call ace_sys_wounds_fnc_isUncon) exitWith {};

call compile format ["NMD_Rev_Data%1 = [_unit] call NMD_rev_fnc_getPlayerData;", _uid];