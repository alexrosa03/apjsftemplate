zCurator addEventHandler ["CuratorObjectPlaced", {
  params ["_curator", "_entity"];
  _unitName = typeOf _entity;
  private _message = format ["Zeus %1 has placed: %2", _curator, _unitName];
  _message remoteExec ["diag_log", 2];
  if (_unitName == "ModuleEndMission_F" || _unitName == "zen_custom_modules_33") then 
  {
    isEndex = true;
    publicVariable "isEndex";
    private _message = format ["Total no. of bandages used: %1", bandageUsed];
    _message remoteExec ["diag_log",2];
  }
}];

zCoCurator addEventHandler ["CuratorObjectPlaced", {
  params ["_curator", "_entity"];
  _unitName = typeOf _entity;
  private _message = format ["Zeus %1 has placed: %2", _curator, _unitName];
  _message remoteExec ["diag_log", 2];
  if (_unitName == "ModuleEndMission_F" || _unitName == "zen_custom_modules_33") then 
  {
    isEndex = true;
    publicVariable "isEndex";
    private _message = format ["Total no. of bandages used: %1", bandageUsed];
    _message remoteExec ["diag_log",2];
  }
}];

zObserver addEventHandler ["CuratorObjectPlaced", {
  params ["_curator", "_entity"];
  _unitName = typeOf _entity;
  private _message = format ["Zeus %1 has placed: %2", _curator, _unitName];
  _message remoteExec ["diag_log", 2];
  if (_unitName == "ModuleEndMission_F" || _unitName == "zen_custom_modules_33") then 
  {
    isEndex = true;
    publicVariable "isEndex";
    private _message = format ["Total no. of bandages used: %1", bandageUsed];
    _message remoteExec ["diag_log",2];
  }
}];

zAdmin addEventHandler ["CuratorObjectPlaced", {
  params ["_curator", "_entity"];
  _unitName = typeOf _entity;
  private _message = format ["Zeus %1 has placed: %2", _curator, _unitName];
  _message remoteExec ["diag_log", 2];
  if (_unitName == "ModuleEndMission_F" || _unitName == "zen_custom_modules_33") then 
  {
    isEndex = true;
    publicVariable "isEndex";
    private _message = format ["Total no. of bandages used: %1", bandageUsed];
    _message remoteExec ["diag_log",2];
  }
}];

zCurator addEventHandler ["CuratorPinged", {
  params ["_curator", "_player"];
  _playerName = name _player;
  zeusPing = zeusPing + 1;
  publicVariable "zeusPing";
  private _message = format ["%1 pinged! No. of pings: %2", _playerName, zeusPing];
  _message remoteExec ["diag_log", 2];
}];

["ace_treatmentSucceded",{
    params["_caller, _target, _selectionName, _className, _itemUser, _usedItem"];
    bandageUsed = bandageUsed + 1;
    publicVariable "bandageUsed";
}]call CBA_fnc_addEventHandler;


player addEventHandler ["Hit", {
  params ["_unit", "_source", "_damage", "_instigator"];
  _unitName = name _unit;
  _instiName = name _instigator;
  if(side _instigator == side _unit && isNull (getAssignedCuratorLogic _instigator) && _unitName != _instiName) then {
    private _message = format ["%1 has friendly fired %2 with %3", _instiName, _unitName, currentWeapon (vehicle _instigator)];
    timesFriendlyFired = timesFriendlyFired + 1;
    publicVariable "timesFriendlyFired";
    private _message2 = format ["Friendly fire incident: %1", timesFriendlyFired];
    _message remoteExec ["diag_log", 2];
    _message2 remoteExec ["diag_log",2];
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