//BIS Dynamic Group
//["Initialize"] call BIS_fnc_dynamicGroups;

bandageUsed = 0;
zeusPing = 0;
timesFriendlyFired = 0;
timesUnconscious = 0;
civieKilled = 0;
isEndex = false;
respawnTimer = 15;
publicVariable "bandageUsed";
publicVariable "zeusPing";
publicVariable "timesFriendlyFired";
publicVariable "civieKilled";
publicVariable "isEndex";
publicVariable "respawnTimer";

//Remove "//" below if you will use LIMITED RESPAWN TICKETS

//[west, #OFTICKETS] call BIS_fnc_respawnTickets;

//Do not remove the code block below

execVM "scripts\serverSide_logs.sqf";