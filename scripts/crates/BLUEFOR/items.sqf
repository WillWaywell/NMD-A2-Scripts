/*
+ ----------------------------------------------------------------------------+
|	File: items.sqf
|	Init: if (isServer) then { null = [this,40] execVM "items.sqf"; };
|	Args: <(object)crate> [(int)item count]
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
_misc_w =	[
"ACE_Kestrel4500",
"ACE_DAGR",
"ACE_Map_Tools",
"ACE_KeyCuffs",
"ACE_SpottingScope",
"ACE_WireCutter",
"ACE_GlassesBalaklava",
"ACE_GlassesBalaklavaGray",
"ACE_GlassesBalaklavaOlive",
"ACE_GlassesLHD_glasses",
"ACE_GlassesSunglasses",
"ACE_GlassesTactical",
"Binocular",
"Binocular_Vector",
"ACE_Rangefinder_OD",
"ACE_YardAge450",
"Laserdesignator",
"ACE_MX2A",
"ACE_Earplugs",
"ACE_GlassesRedSun",
"ACE_GlassesGreenSun",
"ACE_GlassesBlackSun",
"ACE_GlassesBlueSun",
"ACE_GlassesGasMask_US"
];

_misc_m =	[
"IR_Strobe_Marker",
"IR_Strobe_Target",
"Laserbatteries",
"ACE_Battery_Rangefinder"
];
	
// Clear Current Cargo
clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
				
// Add Cargo				
{ _box addWeaponCargoGlobal [_x, _amount]; }
foreach _misc_w;
			
{ _box addMagazineCargoGlobal [_x, _amount]; }
foreach _misc_m;