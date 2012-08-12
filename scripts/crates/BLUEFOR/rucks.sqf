/*
+ ----------------------------------------------------------------------------+
|	File: rucks.sqf
|	Init: if (isServer) then { null = [this,40] execVM "rucks.sqf"; };
|	Args: <(object)crate> [(int)weapon count]
|
|	Author: Nimrod
|	Email: nimrod@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Arguments
_crate 		= _this select 0;
_amount 	= if (count _this > 1) then {_this select 1} else {40};

// Create Array(s)
_weapons = [
"ACE_AssaultPack_BAF",
"ACE_ParachutePack",
"ACE_ParachuteRoundPack"
];
	
// Clear Current Cargo
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
				
// Add Cargo				
{ _crate addWeaponCargoGlobal [_x, _amount]; }
foreach _weapons;