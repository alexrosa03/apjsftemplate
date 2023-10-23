//BIS Dynamic Groups
//["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

//Fuel Consumption script
player addEventHandler ["GetInMan", {[_this select 2] execVM "scripts\functions\logi\kp_fuel_consumption.sqf";}];

addMissionEventHandler ["entityKilled", {_this call a3ph_fnc_civKilled}];

execVM "briefing.sqf";

//remove // below if you will use Limited Respawn Tickets


//[] call BIS_fnc_showMissionStatus;            // to Show remaining Tickets


//Do not remove the EventHandler code block down below.

execVM "scripts\clientSide_logs.sqf";