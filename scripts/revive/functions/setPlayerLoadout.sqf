/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: setPlayerLoadout.sqf
|	Args: <(object)unit>
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

_unit = _this select 0;

if ([_unit] call ace_sys_wounds_fnc_isMedic) then {
	if (!isNull (unitBackpack _unit)) then { removeBackpack _unit }; 
	if ([_unit] call ACE_fnc_HasRuck) then 
	{ 
		_unit removeWeapon ([_unit] call ACE_fnc_FindRuck);
	};
	
	_unit addWeapon NMD_Rev_Ruck;
	sleep 5; // Wait so hopefully the ACE gear system updates correctly
	[player, "BTH"] call ACE_fnc_RemoveGear;
	[_unit, "ACE_LargeBandage", (NMD_Rev_RuckIFAK select 0)] call ACE_fnc_PackMagazine;
	[_unit, "ACE_Bandage", (NMD_Rev_RuckIFAK select 1)] call ACE_fnc_PackMagazine;
	[_unit, "ACE_Morphine", (NMD_Rev_RuckIFAK select 2)] call ACE_fnc_PackMagazine;
	[_unit, "ACE_Epinephrine", (NMD_Rev_RuckIFAK select 3)] call ACE_fnc_PackMagazine;
	[_unit, "ACE_Medkit", (NMD_Rev_RuckIFAK select 4)] call ACE_fnc_PackMagazine;
}
else 
{
	sleep 5;
	[_unit, (NMD_Rev_IFAK select 0), (NMD_Rev_IFAK select 1), (NMD_Rev_IFAK select 2), true] call ACE_fnc_PackIFAK;
};