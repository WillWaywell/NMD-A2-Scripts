/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: setPlayerData.sqf
|	Args: <(object)unit> <(array)data>
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

private ["_unit", "_pos", "_uncons", "_unconsTime", "_lives", "_weapons", "_magazines", "_weaponOB"];
_unit = _this select 0;
_pos = (_this select 1) select 0;
_uncons = ((_this select 1) select 1) select 0;
if (_uncons) then { _unconsTime = ((_this select 1) select 1) select 1 };
_lives = (_this select 1) select 2;
_weapons = (_this select 1) select 3;
_magazines = (_this select 1) select 4;
_weaponOB = (_this select 1) select 5;

removeAllWeapons _unit;
removeAllitems _unit;
removeBackpack _unit;

_unit setVariable ["nmd_rev_lives", _lives];
if (_weaponOB != "") then { _unit addWeapon _weaponOB;  [_unit, _weaponOB] call ACE_fnc_PutWeaponOnBack; };
{ _unit addWeapon _x; } foreach _weapons;
{ _unit addMagazine _x; } foreach _magazines;

if (_uncons) then
{
	_unit setPos _pos;
	[_unit, 1] call ace_sys_wounds_fnc_addDamage;
};