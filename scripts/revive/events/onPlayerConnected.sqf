/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: onPlayerConnected.sqf
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

if(!isServer) exitwith {};

_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;



if (!isNil ("NMD_Rev_Data"+ _uid)) then {
	_id publicVariableClient "NMD_Rev_Data"+ _uid;
	diag_log[format["NMD Revive: Sent JIP Player Data (%1 - %2)", _name, _uid]];
};