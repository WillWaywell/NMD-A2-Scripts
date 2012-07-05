/*
+ ----------------------------------------------------------------------------+
|	File: magazines.sqf
|	Init: if (isServer) then { null = [this,100,true] execVM "magazines.sqf"; };
|	Args: <(object)crate> [(int)ammo count] [(bool)sb ammo]
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Get/Set Variables
_box 		= _this select 0;
_amount 	= if (count _this > 1) then {_this select 1} else {100};
_sbAmmo 	= if (count _this > 2) then {_this select 2} else {true};


// Create Array(s)
_magazines = [ 
"100Rnd_556x45_BetaCMag", 
"ACE_100Rnd_556x45_S_BetaCMag",
"100Rnd_556x45_M249",  
"200Rnd_556x45_M249",
"ACE_100Rnd_556x45_T_M249", 
"ACE_200Rnd_556x45_T_M249", 
"ACE_30Rnd_556x45_S_Stanag", 
"30Rnd_556x45_Stanag", 
"ACE_30Rnd_556x45_T_Stanag",
"30Rnd_556x45_G36", 
"ACE_30Rnd_556x45_AP_G36",
"ACE_30Rnd_556x45_S_G36", 
"ACE_30Rnd_556x45_T_G36",
"100Rnd_762x51_M240",
"17Rnd_9x19_glock17", 
"ACE_33Rnd_9x19_G18",
"ACE_13Rnd_9x19_L9A1",
"ACE_15Rnd_9x19_P226",
"ACE_15Rnd_9x19_P8",
"ACE_12Rnd_45ACP_USP", 
"ACE_12Rnd_45ACP_USPSD",
"7Rnd_45ACP_1911",
"17Rnd_9x19_glock17", 
"ACE_33Rnd_9x19_G18",
"15Rnd_9x19_M9", 
"ACE_15Rnd_9x19_S_M9",
"6Rnd_45ACP",
"30Rnd_9x19_UZI", 
"ACE_30Rnd_9x19_S_UZI",
"20Rnd_B_AA12_74Slug", 
"20Rnd_B_AA12_HE", 
"20Rnd_B_AA12_Pellets",
"ACE_20Rnd_762x51_B_G3", 
"ACE_20Rnd_762x51_T_G3",
"ACE_20Rnd_762x51_B_HK417", 
"ACE_20Rnd_762x51_S_HK417", 
"ACE_20Rnd_762x51_T_HK417",
"ACE_8Rnd_12Ga_Buck00", 
"ACE_8Rnd_12Ga_Slug",
"20Rnd_762x51_DMR", 
"ACE_20Rnd_762x51_T_DMR",
"ACE_30Rnd_1143x23_B_M3",
"30Rnd_9x19_MP5", 
"ACE_30Rnd_9x19_S_MP5",
"ACE_40Rnd_B_46x30_MP7", 
"ACE_40Rnd_S_46x30_MP7",
"20Rnd_762x51_B_SCAR",
"ACE_20Rnd_762x51_S_SCAR",
"ACE_20Rnd_762x51_T_SCAR",
"ACE_20Rnd_762x51_SB_M110",
"ACE_20Rnd_762x51_S_M110",
"ACE_20Rnd_762x51_T_M110",
"ACE_25Rnd_1143x23_B_UMP45", 
"ACE_25Rnd_1143x23_S_UMP45",
"5Rnd_127x99_as50", 
"ACE_5Rnd_127x99_B_TAC50", 
"ACE_5Rnd_127x99_S_TAC50", 
"ACE_5Rnd_127x99_T_TAC50",
"ACE_5Rnd_25x59_HEDP_Barrett",
"5Rnd_86x70_L115A1", 
"ACE_5Rnd_86x70_T_L115A1",
"10Rnd_127x99_m107", 
"ACE_10Rnd_127x99_Raufoss_m107", 
"ACE_10Rnd_127x99_T_m107",
"5Rnd_762x51_M24", 
"ACE_5Rnd_762x51_T_M24",
"10Rnd_762x54_SVD", 
"ACE_10Rnd_762x54_T_SVD",
"ACE_30Rnd_6x35_B_PDW",
"6Rnd_HE_M203", 
"6Rnd_FlareWhite_M203", 
"6Rnd_FlareGreen_M203", 
"6Rnd_FlareRed_M203", 
"6Rnd_FlareYellow_M203", 
"6Rnd_Smoke_M203", 
"6Rnd_SmokeRed_M203", 
"6Rnd_SmokeGreen_M203", 
"6Rnd_SmokeYellow_M203"
];

_magazines_sb = [ 
"ACE_30Rnd_556x45_SB_S_Stanag",
"ACE_30Rnd_556x45_SB_Stanag",
"ACE_20Rnd_762x51_SB_HK417", 
"ACE_20Rnd_762x51_SB_S_HK417",
"ACE_20Rnd_762x51_SB_S_SCAR",
"ACE_20Rnd_762x51_SB_SCAR"
];
	
// Clear Current Cargo
clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
			
// Add Items
{ _crate addMagazineCargoGlobal [_x, _amount]; }
foreach _magazines;

if (_sbAmmo) then {
	{ _crate addMagazineCargoGlobal [_x, _amount];	}
	foreach _magazines_sb;
};