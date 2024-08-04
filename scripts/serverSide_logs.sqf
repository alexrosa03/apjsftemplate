["ace_unconscious",{
    params["_unit","_state"];
    _unitName = name _unit;
    if(_state == true && isplayer _unit) then {
        timesUnconscious = timesUnconscious + 1;
        private _message = format ["%1 went unconscious. Total unconscious: %2", _unitName, timesUnconscious];
        _message remoteExec ["diag_log",2];
    }   
}]call CBA_fnc_addEventHandler;

addMissionEventHandler ["entityKilled", {
    params ["_unit", "_killer"];
    killer = _killer;
    [] spawn {
        private _message = format ["Civilian was killed by %1", name killer];
        civieKilled = civieKilled + 1;
        private _message2 = format ["Total civilians killed: %1", civieKilled];
        publicVariable "civieKilled";
        _message remoteExec ["diag_log", 2];
        _message2 remoteExec ["diag_log",2];
        sleep 10;
    };
}];
