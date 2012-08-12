/*
+ ----------------------------------------------------------------------------+
|	File: magazines_launchers.sqf
|	Script: if (isServer) then { null = [this,4] execVM "magazines_launchers.sqf"; };
|	Args: <(object)crate> [(int)ammo count]
|
|	Author: Nimrod
|	Email: nimrod@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Arguments
_crate 		= _this select 0;
_amount 	= if (count _this > 1) then {_this select 1} else {6};

// Create Array(s)
_magazines = [ 
"SMAW_HEAA",
"SMAW_HEDP",
"ACE_SMAW_NE",
"ACE_SMAW_Spotting",
"ACE_RPG29_PG29", 
"ACE_RPG29_TBG29",
"ACE_MAAWS_HE", 
"MAAWS_HEAT", 
"MAAWS_HEDP",
"ACE_OG7_PGO7", 
"ACE_PG7V_PGO7", 
"ACE_PG7VL_PGO7", 
"ACE_PG7VM", 
"ACE_PG7VM_PGO7", 
"ACE_PG7VR_PGO7", 
"ACE_TBG7V", 
"ACE_TBG7V_PGO7"
];
	
// Clear Current Cargo
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
			
// Add Cargo
{ _crate addMagazineCargoGlobal [_x, _amount]; }
foreach _magazines;