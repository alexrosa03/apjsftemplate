["ace_unconscious",{
    params["_unit","_state"];
    _unitName = name _unit;
    if(_state == true && isplayer _unit) then {
        timesUnconscious = timesUnconscious + 1;
        private _message = format ["%1 went unconscious. Total unconscious: %2", _unitName, timesUnconscious];
        _message remoteExec ["diag_log",2];
    }   
}]call CBA_fnc_addEventHandler;