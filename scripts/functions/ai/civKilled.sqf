params ["_unit", "_killer"];
if (side group _unit == civilian && {isPlayer _killer}) then {
	hintSilent format ["Civilian was killed by %1", name _killer];
};