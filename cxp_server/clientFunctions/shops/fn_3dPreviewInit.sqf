/*
    File: fn_3dPreviewInit.sqf
    Author: BoGuu & KLM
    Description:
    Called to initialize the 3d preview.
*/
if !(params [["_display", displayNull, [displayNull]]]) exitWith {};
cxp_3dPreview_position = [0, 0, 10000];
// create camera
cxp_3dPreview_camera = "camera" camCreate cxp_3dPreview_position;
cxp_3dPreview_camera cameraEffect ["Internal", "BACK"];
cxp_3dPreview_camera camSetFocus [-1, -1];
showCinemaBorder false;
cxp_3dPreview_camera camCommit 0;
// create light
cxp_3dPreview_light = "#lightpoint" createVehicleLocal cxp_3dPreview_position;
cxp_3dPreview_light setLightBrightness 0.5;
cxp_3dPreview_light setLightColor [1, 1, 1];
cxp_3dPreview_light setLightAmbient [1, 1, 1];
// set initial values for global vars
cxp_3dPreview_camera_mag = 0;
cxp_3dPreview_camera_zoom = 0;
cxp_3dPreview_camera_target = [];
cxp_3dPreview_object = objNull;
cxp_3dPreview_dragging = false;
// event handlers
cxp_3dPreview_evh_down = _display displayAddEventHandler ["MouseButtonDown", {cxp_3dPreview_dragging = true}];
cxp_3dPreview_evh_up = _display displayAddEventHandler ["MouseButtonUp", {cxp_3dPreview_dragging = false}];
cxp_3dPreview_evh_move = _display displayAddEventHandler ["MouseMoving", {
    params ["", "_dx", "_dy"];
    if (cxp_3dPreview_dragging) then {
        private _dir = vectorDir cxp_3dPreview_object;
        private _newdir = [(_dir select 0) * cos _dx - (_dir select 1) * sin _dx, (_dir select 0) * sin _dx + (_dir select 1) * cos _dx, 0];
        cxp_3dPreview_object setVectorDir vectorNormalized _newdir;
    };
}];
cxp_3dPreview_evh_zoom = _display displayAddEventHandler ["MouseZChanged", {
    params ["", "_scroll"];
    private _max = cxp_3dPreview_camera_mag;
    private _object = cxp_3dPreview_object;
    private _bodyDiagonal = [boundingBoxReal _object select 0 select 0, boundingBoxReal _object select 0 select 2] distance [boundingBoxReal _object select 1 select 0, boundingBoxReal _object select 1 select 2];
    private _min = _bodyDiagonal + 1;
    private _step = (_max - _min) / 10;
    private _oldPos = getPos cxp_3dPreview_camera;
    cxp_3dPreview_camera_zoom = _min max (cxp_3dPreview_camera_zoom - (_step * (abs (_scroll) / _scroll)));
    cxp_3dPreview_camera_zoom = _max min cxp_3dPreview_camera_zoom;
    if (cxp_3dPreview_camera_zoom >= _max || {cxp_3dPreview_camera_zoom <= _min}) exitWith {};
    private _newPos = cxp_3dPreview_camera_target vectorAdd ((vectorNormalized ((getPos cxp_3dPreview_camera) vectorDiff cxp_3dPreview_camera_target)) vectorMultiply cxp_3dPreview_camera_zoom);
    cxp_3dPreview_camera camSetPos _newPos;
    cxp_3dPreview_camera camCommit 0.15;
}];