/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: getPlayerData.sqf
|	Args: <(object)unit>
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

private ["_unit", "_return",  "_pos", "_uncons", "_unconsTime", "_lives", "_weapons", "_magazines", "_weaponOB"];
_unit = _this select 0;
_pos = (getpos _unit);
_uncons = _unit call ace_sys_wounds_fnc_isUncon;
_unconsTime = round ((player getVariable "ace_w_revive") - time + (player getVariable "ace_w_cardiactime"));
_lives = (_unit getVariable "nmd_rev_lives");
_weapons = (weapons _unit);
_magazines = (magazines _unit);
_weaponOB = [_unit] call ACE_fnc_WeaponOnBackName;


_return = [_pos,[_uncons,_unconsTime],_lives,_weapons,_magazines,_weaponOB];
_return;