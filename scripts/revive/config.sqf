/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: config.sqf
|
|	Author: Nimrod
|	Email: nimrod@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

if (isNil "NMD_Rev_Time")			then {		NMD_Rev_Time = 600 					};
if (isNil "NMD_Rev_Lives")			then {		NMD_Rev_Lives = 5					};
if (isNil "NMD_Rev_Spectator")			then {		NMD_Rev_Spectator = true				};
if (isNil "NMD_Rev_IFAK")			then {		NMD_Rev_IFAK = [1,1,1]					};
if (isNil "NMD_Rev_Medic_Ruck")			then {		NMD_Rev_Medic_Ruck = "ACE_AssaultPack_BAF"		};
if (isNil "NMD_Rev_Medic_Ruck_IFAK")		then {		NMD_Rev_Medic_Ruck_IFAK = [10,10,10,10,6,4]		};
if (isNil "NMD_Rev_Markers")			then {		NMD_Rev_Markers = true					};
if (isNil "NMD_Rev_NoAI")			then {		NMD_Rev_NoAI = true					};
if (isNil "NMD_Rev_Persistent")			then {		NMD_Rev_Persistent = false				};