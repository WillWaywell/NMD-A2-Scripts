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
_crate 		= _this select 0;
_amount 	= if (count _this > 1) then {_this select 1} else {40};

// Create Array(s)
_weapons = [
"ACE_Kestrel4500",
"ACE_DAGR",
"ACE_MAP",
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

_magazines = [
"IR_Strobe_Marker",
"IR_Strobe_Target",
"Laserbatteries",
"ACE_Battery_Rangefinder"
];
	
// Clear Current Cargo
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
				
// Add Cargo				
{ _crate addWeaponCargoGlobal [_x, _amount]; }
foreach _weapons;
			
{ _crate addMagazineCargoGlobal [_x, _amount]; }
foreach _magazines;