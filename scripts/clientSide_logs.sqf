{ _x addEventHandler ["CuratorObjectPlaced", {
    params ["_curator", "_entity"];
    _unitName = typeOf _entity;
    private _message = format ["Zeus %1 has placed: %2", _curator, _unitName];
   _message remoteExec ["diag_log", 2];
    if (_unitName == "ModuleEndMission_F" || _unitName == "zen_custom_modules_33") then 
    {
      isEndex = true;
      publicVariable "isEndex";
    };
  }];
} forEach allCurators;

zCurator addEventHandler ["CuratorPinged", {
  params ["_curator", "_player"];
  _playerName = name _player;
  private _message = format ["%1 pinged!", _playerName];
  _message remoteExec ["diag_log", 2];
}];

alreadyHit = false;

player addEventHandler ["Hit", {
  params ["_unit", "_source", "_damage", "_instigator"];
  _unitName = name _unit;
  _instiName = name _instigator;
  if(side _instigator == side _unit && isNull (getAssignedCuratorLogic _instigator) && _unitName != _instiName) then {
    private _message = format ["%1 has friendly fired %2 with %3", _instiName, _unitName, currentWeapon (vehicle _instigator)];
    _message remoteExec ["diag_log", 2];
    if (alreadyHit == false) then {
      [] spawn {
        alreadyHit = true;
        timesFriendlyFired = timesFriendlyFired + 1;
        publicVariable "timesFriendlyFired";
        private _message2 = format ["Friendly fire incident: %1", timesFriendlyFired];
        _message2 remoteExec ["diag_log",2];
        sleep 10;
        alreadyHit = false;
      };
    };
  };

  if(!isNull (getAssignedCuratorLogic _instigator)) then {
    if(cameraOn isEqualTo _instigator) then {
      private _curSecMessage = format ["Curator %1 shot incident on %2 secretly possibly with %3", _instiName, _unitName, currentWeapon (vehicle _instigator)];
      _curSecMessage remoteExec ["diag_log",2];
    } else {
      private _curMessage = format ["Curator %1 remote controlled and shot on %2 possibly with %3", _instiName, _unitName, currentWeapon(vehicle cameraon)];
      _curMessage remoteExec ["diag_log",2];
    };
  };
}];

["ace_firedPlayer",{
  params["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
  if(isEndex == true) then {    
    _unitName = name _unit;
    private _message = format ["%1 has fired a/an %2 (%3) at endex.",_unitName , _weapon, _ammo];
    _message remoteExec ["diag_log",2];
  }
}]call CBA_fnc_addEventHandler;

["ace_firedPlayerVehicle",{
  params["_vehicle", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
  if(isEndex == true) then {    
    _unitName = name _gunner;
    private _message = format ["%1 has fired a/an %2 (%3) at endex.",_unitName , _weapon, _vehicle];
    _message remoteExec ["diag_log",2];
  }
}]call CBA_fnc_addEventHandler;

zeusRole = "";

switch (vehicleVarName player) do
{
	case "curator1": {
    zeusRole = "Main Curator"
  };
	case "curator2": {
    zeusRole = "Co-Curator"
  };
	case "observer": {
    zeusRole = "Observer"
  };
};

private _messageVar = format ["%1 has slotted and logged in as %2.", name player, zeusRole];
  _messageVar remoteExec ["diag_log",2];