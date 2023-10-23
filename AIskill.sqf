/* add
[] execVM "AIskill.sqf"; 
to init.sqf
*/

//you can change the values

 mad_ifnc_aiskill= 
 {
  params ['_dude'];
  _dude setSkill ['aimingAccuracy', .2 + (random 0.05)];
  _dude setSkill ['aimingShake', .19 + (random 0.05)];
  _dude setSkill ['aimingSpeed', .19 + (random 0.05)];
  _dude setSkill ['spotDistance', .19 + (random 0.1)];
  _dude setSkill ['spotTime', .55 + (random 0.05)];
  _dude setSkill ['courage', .75];
  _dude setSkill ['reloadSpeed', 1];
  _dude setSkill ['commanding',.85];
  _dude setSkill ['general', .9 + (random 0.05)]; 
 };  
{
	_x addEventHandler ["CuratorObjectPlaced", {
	params ["", "_entity"];     
	if (_entity isKindOf 'CAManBase') then
		{
			[_entity] call mad_ifnc_aiskill;            
		};        
	if ((_entity isKindOf 'LandVehicle')or(_entity isKindOf 'AIR')or(_entity isKindOf 'ship'))  then
		{
			{
				[_x]call mad_ifnc_aiskill;            
			} foreach crew _entity
		};    
	}];
} forEach allCurators;