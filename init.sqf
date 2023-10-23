enableSaving [ false, false ];

//REMOVE 2 lines below if no VCOM
_A3PH_vcomEnable = "A3PH_vcomEnable" call BIS_fnc_getParamValue;
if (_A3PH_vcomEnable isEqualTo 1) then {[] spawn VCM_fnc_VcomInit;};

[] execVM "AIskill.sqf";	//REMOVE IF VCOM IS ENABLED

//Advanced Towing and Slingloading
[] spawn a3ph_fnc_advancedSlingLoad;
[] spawn a3ph_fnc_advancedTowing;

if (isServer) then {
    [] call compileFinal preprocessFileLineNumbers "scripts\show_fps.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
    execVM "scripts\show_fps.sqf";
};

player addrating 100000; // for disabling Pardon feature

