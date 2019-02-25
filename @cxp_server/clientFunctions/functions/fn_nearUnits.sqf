/*
    File: fn_nearUnits.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Checks for units near (human units)

    Returns:
    true - Units are near
    false - No units near
    OR
    Array - [true/false,[allunitsnear]]
*/
private _faction = param [0,sideUnknown,[sideUnknown,[]]];
private _position = param [1,(getPos player),[[]]];
private _radius = param [2,30,[0]];
private _verificPlUnits = param [3,false,[false]];

private _ret = false;
private _playerUnitsRet = [];

//Error check
if (_faction isEqualTo [] || _faction isEqualTo sideUnknown) exitWith {_ret};

if (_verificPlUnits) then {
  if (_faction isEqualType []) then {
    {
      if (player != _x && side _x in _faction && _position distance _x < _radius) then {
        _playerUnitsRet pushBack _x;
      };
    } forEach allPlayers;
  } else {
    {
      if (player != _x && side _x isEqualTo _faction && _position distance _x < _radius) then {
        _playerUnitsRet pushBack _x;
      };
    } forEach allPlayers;
  };
  _ret = [true,_playerUnitsRet];
} else {
  _ret = {
    player != _x && side _x isEqualTo _faction && alive _x && _position distance _x < _radius
  } count playableUnits > 0;
};
_ret;
