/*
+ ----------------------------------------------------------------------------+
|	File: radios.sqf
|	Init: if (isServer) then { null = [this,30] execVM "radios.sqf"; };
|	Args: <(object)crate> [(int)weapon count]
|
|	Author: Nimrod
|	Email: nimrod@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Arguments
_crate 		= _this select 0;
_amount 	= if (count _this > 1) then {_this select 1} else {30};

// Create Array(s)
_weapons = [
"ACRE_PRC148",
"ACE_PRC119",
"ACE_PRC119_ACU",
"ACRE_PRC117F"
];

// Clear Current Cargo
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
			
// Add Cargo
{ _crate addWeaponCargoGlobal [_x, _amount]; }
foreach _weapons;