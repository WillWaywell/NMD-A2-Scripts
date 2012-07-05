/*
+ ----------------------------------------------------------------------------+
|	File: rucks.sqf
|	Script: if (isServer) then { null = [this,40] execVM "rucks.sqf"; };
|	Args: <(object)crate> [(int)ruck count]
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Arguments
_box 		= _this select 0;
_amount 	= if (count _this > 1) then {_this select 1} else {40};

// Create Array(s)
_rucks =	[
"ACE_AssaultPack_BAF",
"ACE_ParachutePack",
"ACE_ParachuteRoundPack"
];
	
// Clear Current Cargo
clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
				
// Add Cargo				
{ 
	_box addWeaponCargoGlobal [_x, _amount]; 
}
foreach _rucks;