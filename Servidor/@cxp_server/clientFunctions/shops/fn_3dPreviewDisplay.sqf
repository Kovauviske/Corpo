/*
    File: fn_3dPreviewDisplay.sqf
    Author: KLM
    Description:
    Called to change the object in the 3d preview.
*/
if !(params [["_className", "", [""]]]) exitWith {};
if (isNil "cxp_3dPreview_camera" || {isNull cxp_3dPreview_camera}) exitWith {};
private _isInCfg = (isClass (configFile >> "CfgVehicles" >> _className));
if (_isInCfg) then {
    if (isNull cxp_3dPreview_object || {!(_className isEqualTo typeOf cxp_3dPreview_object)}) then {
        if (!isNull cxp_3dPreview_object) then {deleteVehicle cxp_3dPreview_object;};
        private _object = _className createVehicleLocal [0, 0, 0];
        if (isNull _object) exitWith {diag_log format ["3dPreview - problem creating object: %1", _className]};
        cxp_3dPreview_object = _object;
        cxp_3dPreview_object enableSimulation false;
        cxp_3dPreview_object setPos cxp_3dPreview_position;
        cxp_3dPreview_object setVectorUp [0, 0, 1];
        private _bodyDiagonal = [boundingBoxReal _object select 0 select 0, boundingBoxReal _object select 0 select 2] distance [boundingBoxReal _object select 1 select 0, boundingBoxReal _object select 1 select 2];
        private _distance = _bodyDiagonal * 2;
        cxp_3dPreview_camera_target = getPos _object;
        cxp_3dPreview_camera camSetTarget cxp_3dPreview_camera_target;
        cxp_3dPreview_camera camSetPos (_object modelToWorld [0, _distance, _distance * 0.3]);
        cxp_3dPreview_camera setVectorUp [0, 0, 1];
        cxp_3dPreview_camera camCommit 0;
        cxp_3dPreview_camera_mag = vectorMagnitude (cxp_3dPreview_object worldToModel (getPos cxp_3dpreview_camera));
        cxp_3dPreview_camera_zoom = cxp_3dPreview_camera_mag;
    };
};