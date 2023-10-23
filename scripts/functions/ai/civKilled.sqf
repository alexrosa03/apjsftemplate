params ["_unit", "_killer"];
if (side group _unit == civilian && {isPlayer _killer}) then {
	hintSilent format ["Civilian was killed by %1", name _killer];
	private _message = format ["Civilian was killed by %1", name _killer];
    civieKilled = civieKilled + 1;
	private _message2 = format ["Total civilians killed: %1", civieKilled];
	publicVariable "civieKilled";
	_message remoteExec ["diag_log", 2];
	_message2 remoteExec ["diag_log",2];
};