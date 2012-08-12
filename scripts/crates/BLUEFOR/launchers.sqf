/*
+ ----------------------------------------------------------------------------+
|	File: launchers.sqf
|	Script: if (isServer) then { null = [this,2] execVM "launchers.sqf"; };
|	Args: <(object)crate> [(int)weapon count]
|
|	Author: Nimrod
|	Email: nimrod@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Arguments
_crate 		= _this select 0;
_amount 	= if (count _this > 1) then {_this select 1} else {2};

// Create Array(s)
_weapons = [ 
"SMAW",
"M136",
"ACE_RPG29",
"ACE_RPG22",
"ACE_M136_CSRS",
"ACE_M72",
"ACE_M72A2",
"RPG18",
"MAAWS",
"ACE_RPG7V_PGO7",
"RPG7V",
"ACE_RPOM",
"MetisLauncher",
"M47Launcher_EP1"
];

// Clear Current Cargo
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
			
// Add Cargo
{ _crate addWeaponCargoGlobal [_x, _amount]; }
foreach _weapons;