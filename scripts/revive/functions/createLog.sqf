/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: createLog.sqf
|	Args: <(any)anything> <(int)type>
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

_log = _this select 0;
_type = _this select 1;

switch (_type) do
{
	case 0: { _type = "INFO" };
	case 1: { _type = "WARNING" };
	case 2: { _type = "ERROR" };
};

diag_log[format["NMD Revive |%1| : %2", _type, _log]];