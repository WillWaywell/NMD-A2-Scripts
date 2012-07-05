/*
+ ----------------------------------------------------------------------------+
|	File: loadout.sqf
|	Init: null = [this, "TYPE"] execVM "loadout.sqf";
|	Args: <(object)unit> <(string)type>
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

_unit = _this select 0;
_strType = _this select 1;

waitUntil {!isNull player};
diag_log["NMD Loadout: player != null"];
waitUntil {!isNull _unit};
diag_log["NMD Loadout: _unit != null"];
if (_unit != player) exitWith { diag_log["NMD Loadout: _unit != player"]; };
waitUntil {local _unit};
diag_log["NMD Loadout: _unit local - true"];
waitUntil {!isNil "ace_sys_ruck"}; waitUntil {ace_sys_ruck};
diag_log["NMD Loadout: ace_sys_ruck loaded"];

removeAllWeapons _unit;
removeAllitems _unit;
removeBackpack _unit;

// Global Kit
_unit addweapon "ACRE_PRC148";
_unit addweapon "ACE_Earplugs";
_unit addweapon "ACE_DAGR";
_unit addweapon "ItemCompass";
_unit addweapon "ItemWatch";
_unit addweapon "NVGoggles";

// Check for ACE Wounds
if (ace_sys_wounds_enabled) then 
{ 
	[_unit, 2, 2, 2] call ACE_fnc_PackIFAK;
	
	if (_strType == "MEDIC") then 
	{ 
		_unit addWeapon "ACE_AssaultPack_BAF";
		[_unit, "ACE_LargeBandage", 10] call ACE_fnc_PackMagazine;
		[_unit, "ACE_Bandage", 10] call ACE_fnc_PackMagazine;
		[_unit, "ACE_Morphine", 10] call ACE_fnc_PackMagazine;
		[_unit, "ACE_Epinephrine", 10] call ACE_fnc_PackMagazine;
		[_unit, "ACE_Medkit", 10] call ACE_fnc_PackMagazine;
	};
};

switch (toUpper(_strType)) do
{
	case "TL":
	{		
	    _unit addWeapon "BAF_L85A2_UGL_ACOG";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8,9,10];
	    _unit addMagazine "BAF_L109A1_HE";
		_unit addMagazine "SmokeShell";
		{_unit addMagazine "ACE_1Rnd_HE_M203";} forEach [1,2,3,4,5,6,7,8];
		
		_unit addweapon "ACE_Map";
		_unit addweapon "ACE_Rangefinder_OD";
		_unit addweapon "ACE_GlassesTactical";
		_unit addweapon "ACE_Map_Tools";
	};
	
	case "RM":
	{		
	    _unit addWeapon "BAF_L85A2_UGL_SUSAT";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8,9,10];
	    _unit addMagazine "BAF_L109A1_HE";
		_unit addMagazine "SmokeShell";
		{_unit addMagazine "ACE_1Rnd_HE_M203";} forEach [1,2,3,4,5,6,7,8];
		
		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
		_unit addweapon "ACE_GlassesTactical";
	};
	
	case "ARM":
	{		
	    _unit addWeapon "BAF_L110A1_Aim";
		
		{_unit addMagazine "ACE_200Rnd_556x45_T_M249";} forEach [1,2,3,4,5];
		_unit addMagazine "SmokeShell";
		_unit addMagazine "SmokeShellOrange";
		
		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
		_unit addweapon "ACE_GlassesTactical";
	};
	
	case "MM_LRR":
	{		
	    _unit addWeapon "BAF_LRR_scoped_W";
		
		{_unit addMagazine "5Rnd_86x70_L115A1";} forEach [1,2,3,4,5,6,7,8,9,10];
		_unit addMagazine "SmokeShell";
		_unit addMagazine "SmokeShellOrange";
		
		_unit addWeapon "ACE_L9A1";
		{_unit addMagazine "ACE_13Rnd_9x19_L9A1";} forEach [1,2,3,4];
		
		_unit addweapon "ItemMap";
		_unit addweapon "ACE_Rangefinder_OD";
	};
	
	case "MM_LSW":
	{		
	    _unit addWeapon "BAF_L86A2_ACOG";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8,9,10];
		_unit addMagazine "BAF_L109A1_HE";
		_unit addMagazine "SmokeShell";
		
		_unit addweapon "ItemMap";
		_unit addweapon "ACE_Rangefinder_OD";
	};
	
	case "ENGI":
	{		
	    _unit addWeapon "BAF_L85A2_RIS_SUSAT";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8,9];
		_unit addMagazine "SmokeShell";
		{_unit addMagazine "BAF_L109A1_HE";} forEach [1,2];
		
		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
		
		_unit addWeapon "ACE_AssaultPack_BAF";
		[_unit, "ACE_M2SLAM_M", 2] call ACE_fnc_PackMagazine;
		[_unit, "ACE_CLAYMORE_M", 2] call ACE_fnc_PackMagazine;
		[_unit, "ACE_C4_M", 3] call ACE_fnc_PackMagazine;
	};

	case "MG":
	{		
	    _unit addWeapon "ACE_BAF_L7A2_GPMG";
		
		{_unit addMagazine "100Rnd_762x51_M240";} forEach [1,2,3,4];
		{_unit addMagazine "BAF_L109A1_HE";} forEach [1,2];
		{_unit addMagazine "SmokeShell";} forEach [1,2,3];

		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
	};
	
	case "ASSI_MG":
	{		
	    _unit addWeapon "BAF_L85A2_RIS_SUSAT";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8,9];
		_unit addMagazine "SmokeShell";
		{_unit addMagazine "BAF_L109A1_HE";} forEach [1,2];
		
		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
		
		_unit addWeapon "ACE_AssaultPack_BAF";
		[_unit, "100Rnd_762x51_M240", 4] call ACE_fnc_PackMagazine;
	};

	case "AT_NLAW":
	{
	    _unit addWeapon "BAF_L85A2_UGL_SUSAT";
		_unit addWeapon "BAF_NLAW_Launcher";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8,9,10];
		_unit addMagazine "BAF_L109A1_HE";
		_unit addMagazine "SmokeShell";
		{_unit addMagazine "ACE_1Rnd_HE_M203";} forEach [1,2,3,4,5,6,7,8];
		
		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
	};
	
	case "AT_JAV":
	{
	    _unit addWeapon "BAF_L85A2_RIS_Holo";
		_unit addWeapon "ACE_Javelin_Direct";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8,9,10];
		{_unit addMagazine "SmokeShell";} forEach [1,2];
		
		_unit addweapon "ItemMap";
		_unit addweapon "ACE_Javelin_CLU";
	};
	
	case "AT_SMAW":
	{
	    _unit addWeapon "BAF_L85A2_RIS_SUSAT";
		_unit addWeapon "SMAW";
		 
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8];
		{_unit addMagazine "SMAW_HEAA";} forEach [1,2];
		{_unit addMagazine "ACE_SMAW_Spotting";} forEach [1,2];
		
		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
	};
	
	case "ASSI_AT_SMAW":
	{
	    _unit addWeapon "BAF_L85A2_UGL_SUSAT";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8,9,10];
		{_unit addMagazine "SmokeShell";} forEach [1,2];
		{_unit addMagazine "ACE_1Rnd_HE_M203";} forEach [1,2,3,4,5,6,7,8];
		
		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
		
		_unit addWeapon "ACE_AssaultPack_BAF";
		[_unit, "SMAW_HEAA", 2] call ACE_fnc_PackMagazine;
		[_unit, "ACE_SMAW_Spotting", 4] call ACE_fnc_PackMagazine;
		[_unit, "ACE_30Rnd_556x45_T_Stanag", 4] call ACE_fnc_PackMagazine;
	};
	
	case "AA":
	{	
	    _unit addWeapon "BAF_L85A2_RIS_SUSAT";
		_unit addWeapon "ACE_AssaultPack_BAF";
		[_unit, "ACE_AssaultPack_BAF"] call ACE_fnc_PutWeaponOnBack;
		_unit addWeapon "Stinger";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6];
		_unit addMagazine "Stinger";

		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
		
		[_unit, "ACE_30Rnd_556x45_T_Stanag", 5] call ACE_fnc_PackMagazine;
		[_unit, "SmokeShell", 2] call ACE_fnc_PackMagazine;
	};
	
	case "ASSI_AA":
	{
	    _unit addWeapon "BAF_L85A2_UGL_SUSAT";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8,9,10];
		{_unit addMagazine "SmokeShell";} forEach [1,2];
		{_unit addMagazine "ACE_1Rnd_HE_M203";} forEach [1,2,3,4,5,6,7,8];
		
		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
		
		_unit addWeapon "ACE_AssaultPack_BAF";
		[_unit, "Stinger", 1] call ACE_fnc_PackMagazine;
		[_unit, "ACE_30Rnd_556x45_T_Stanag", 4] call ACE_fnc_PackMagazine;
	};
	
	case "MEDIC":
	{	
		_unit addWeapon "BAF_L85A2_RIS_SUSAT";

		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8];
		{_unit addMagazine "SmokeShell";} forEach [1,2];
		{_unit addMagazine "SmokeShellOrange";} forEach [1,2];
		
		_unit addweapon "ItemMap";
		_unit addweapon "Binocular";
	};
		
	case "SNIPER_LRR":
	{
	    _unit addWeapon "BAF_LRR_scoped";
		
		{_unit addMagazine "5Rnd_86x70_L115A1";} forEach [1,2,3,4,5,6,7,8,9,10];
		_unit addMagazine "SmokeShell";
		_unit addMagazine "SmokeShellOrange";
		
		_unit addWeapon "ACE_L9A1";
		{_unit addMagazine "ACE_13Rnd_9x19_L9A1";} forEach [1,2,3,4];
		
		_unit addweapon "ItemMap";
		_unit addweapon "ACE_Rangefinder_OD";
		_unit addweapon "ACE_GlassesBalaklavaOlive";
	};	
	
	case "SNIPER_AS50":
	{
	    _unit addWeapon "BAF_AS50_scoped";
		
		{_unit addMagazine "10Rnd_127x99_m107";} forEach [1,2,3,4,5,6];
		_unit addMagazine "SmokeShell";
		_unit addMagazine "SmokeShellOrange";
		
		_unit addWeapon "ACE_L9A1";
		{_unit addMagazine "ACE_13Rnd_9x19_L9A1";} forEach [1,2,3,4];
		
		_unit addweapon "ItemMap";
		_unit addweapon "ACE_Rangefinder_OD";
		_unit addweapon "ACE_GlassesBalaklavaOlive";
	};	
	
	case "SPOTTER":
	{
	    _unit addWeapon "BAF_L86A2_ACOG";
		
		{_unit addMagazine "ACE_30Rnd_556x45_T_Stanag";} forEach [1,2,3,4,5,6,7,8];
		{_unit addMagazine "ACE_Battery_Rangefinder";} forEach [1,2];
		_unit addMagazine "SmokeShell";
		_unit addMagazine "SmokeShellOrange";
		
		_unit addweapon "ACE_Map";
		_unit addweapon "ACE_GlassesBalaklavaOlive";
		_unit addweapon "ACE_Rangefinder_OD";
		_unit addweapon "ACE_SpottingScope";
		_unit addweapon "ACE_Kestrel4500";
	};	
};

_primaryWeapon = primaryWeapon _unit;
_unit selectweapon _primaryWeapon;
_muzzles = getArray(configFile>>"cfgWeapons" >> _primaryWeapon >> "muzzles");
_unit selectWeapon (_muzzles select 0);