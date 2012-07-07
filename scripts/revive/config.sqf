/*
+ ----------------------------------------------------------------------------+
|	Script: NMD ACE Revive
|	File: config.sqf
|
|	Author: Hawk
|	Email: hawk@nomandown.com
|	Website: www.nomandown.com
+ ----------------------------------------------------------------------------+
*/

if (isNil "NMD_Rev_Time")		then {		NMD_Rev_Time = 600 						};
if (isNil "NMD_Rev_Lives")		then {		NMD_Rev_Lives = 5						};
if (isNil "NMD_Rev_Spectator")	then {		NMD_Rev_Spectator = true				};
if (isNil "NMD_Rev_IFAK")		then {		NMD_Rev_IFAK = [2,2,2]					};
if (isNil "NMD_Rev_Ruck")		then {		NMD_Rev_Ruck = "ACE_AssaultPack_BAF"	};
if (isNil "NMD_Rev_RuckIFAK")	then {		NMD_Rev_RuckIFAK = [10,10,10,10,10]		};
if (isNil "NMD_Rev_Markers")	then {		NMD_Rev_Markers = true					};
if (isNil "NMD_Rev_NoAI")		then {		NMD_Rev_NoAI = true						};
if (isNil "NMD_Rev_Persistent")	then {		NMD_Rev_Persistent = false				};