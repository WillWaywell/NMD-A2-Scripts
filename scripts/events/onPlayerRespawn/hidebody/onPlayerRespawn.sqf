/*
+ ----------------------------------------------------------------------------+
|	File: onPlayerRespawn.sqf
|	Init: this addMPEventHandler ["MPRespawn", {Null = _this execVM "playerRespawn.sqf";}];
|	Args: <(object)unit> <(object)corpse>
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

// Arguments
_unit = _this select 0;
_corpse = _this select 1;

// Hide Corpse
hideBody _corpse;
sleep 5;
deleteVehicle _corpse;