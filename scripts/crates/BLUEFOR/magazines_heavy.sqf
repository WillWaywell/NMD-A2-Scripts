/*
+ ----------------------------------------------------------------------------+
|	File: magazines_heavy.sqf
|	Script: if (isServer) then { null = [this,2,8] execVM "magazines_heavy.sqf"; };
|	Args: <(object)crate> [(int)weapon count] [(int)ammo count]
|
|	Author: Nimrod
|	Email: nimrod@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Arguments
_crate 		= _this select 0;
_amountw 	= if (count _this > 1) then {_this select 1} else {2};
_amountm 	= if (count _this > 2) then {_this select 2} else {8};

// Create Array(s)
_weapons = [ 
"ace_arty_rangeTable_m224_legacy",
"ace_arty_rangeTable_m252_legacy"
];

_magazines = [ 
"ACE_M2_CSWDM",
"ACE_MK19_CSWDM",
"ACE_M224HE_CSWDM", 
"ACE_M224WP_CSWDM", 
"ACE_M224IL_CSWDM",
"ACE_M252HE_CSWDM", 
"ACE_M252WP_CSWDM", 
"ACE_M252IL_CSWDM"
];
	
// Clear Current Cargo
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
			
// Add Cargo
{ _crate addWeaponCargoGlobal [_x, _amountw]; }
foreach _weapons;

{ _crate addMagazineCargoGlobal [_x, _amountm]; }
foreach _magazines;