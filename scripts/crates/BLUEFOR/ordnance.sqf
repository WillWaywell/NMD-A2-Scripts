/*
+ ----------------------------------------------------------------------------+
|	File: ordnance.sqf
|	Init: if (isServer) then { null = [this,10,40] execVM "ordnance.sqf"; };
|	Args: <(object)crate> [(int)weapon count] [(int)ammo count]
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Arguments
_box 		= _this select 0;
_amountw 	= if (count _this > 1) then {_this select 1} else {10};
_amountm 	= if (count _this > 2) then {_this select 2} else {40};

// Create Array(s)
_ordnance_w =	[
"ACE_Minedetector_US"
];

_ordnance_m =	[
"SmokeShell",
"SmokeShellBlue",
"SmokeShellGreen",
"SmokeShellOrange",
"SmokeShellPurple",
"SmokeShellRed",
"SmokeShellYellow",
"HandGrenade_West",
"BAF_L109A1_HE",
"ACE_ANM14",
"ACE_Flashbang",
"ACE_M84",
"ACE_TORCH_C",
"ACE_Claymore_M",
"PipeBomb",
"Mine",
"ACE_1Rnd_CS_M203",
"ACE_1Rnd_HE_M203",
"ACE_1Rnd_PR_M203",
"ACE_FlareIR_M203",
"ACE_SSGreen_M203",
"ACE_SSRed_M203",
"ACE_SSWhite_M203",
"ACE_SSYellow_M203",
"1Rnd_Smoke_M203", 
"1Rnd_SmokeGreen_M203", 
"1Rnd_SmokeRed_M203",
"1Rnd_SmokeYellow_M203",
"FlareGreen_M203",
"FlareRed_M203",
"FlareWhite_M203",
"FlareYellow_M203",
"ACE_40mm_Buck_M79",
"ACE_M576",
"ACE_M7A3",
"ACE_M7A3",
"ACE_BBETTY_M", 
"ACE_C4_M", 
"ACE_DM12PARM1_M", 
"ACE_DM31_M", 
"ACE_M2SLAM_M", 
"ACE_M4SLAM_M", 
"ACE_MON50_M", 
"ACE_OSM4_M", 
"ACE_POMZ_M", 
"ACE_PPM2_M", 
"ACE_TRIPFLARE_M",
"BAF_ied_v1",
"BAF_ied_v2",
"BAF_ied_v3",
"BAF_ied_v4"
];

// Clear Current Cargo
clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
				
// Add Cargo
{ _box addWeaponCargoGlobal [_x, _amountw]; }
foreach _ordnance_w;
				
{ _box addMagazineCargoGlobal [_x, _amountm]; }
foreach _ordnance_m;