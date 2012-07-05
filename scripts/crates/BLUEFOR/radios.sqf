/*
+ ----------------------------------------------------------------------------+
|	File: radios.sqf
|	Init: if (isServer) then { null = [this,30] execVM "radios.sqf"; };
|	Args: <(object)crate> [(int)radio count]
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Arguments
_box 		= _this select 0;
_amount 	= if (count _this > 1) then {_this select 1} else {30};

// Create Array(s)
_radios =	[
"ACRE_PRC148",
"ACE_PRC119",
"ACE_PRC119_ACU",
"ACRE_PRC117F"
];

// Clear Current Cargo
clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
			
// Add Cargo
{ _box addWeaponCargoGlobal [_x, _amount]; }
foreach _radios;