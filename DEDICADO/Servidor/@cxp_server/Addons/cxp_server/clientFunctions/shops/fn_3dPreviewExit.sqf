/*
    File: fn_3dPreviewExit.sqf
    Author: KLM
    Description:
    Handles the cleanup of the 3d preview.
*/
if !(params [["_display", displayNull, [displayNull]]]) exitWith {};
// delete objects
if (!isNull cxp_3dPreview_object) then {deleteVehicle cxp_3dPreview_object;};
deleteVehicle cxp_3dPreview_light;
cxp_3dPreview_camera cameraEffect ["Terminate", "BACK"];
camDestroy cxp_3dPreview_camera;
// nil variables
cxp_3dPreview_position = nil;
cxp_3dPreview_object = nil;
cxp_3dPreview_light = nil;
cxp_3dPreview_camera = nil;
cxp_3dPreview_camera_mag = nil;
cxp_3dPreview_camera_zoom = nil;
cxp_3dPreview_camera_target = nil;
cxp_3dPreview_dragging = nil;
// remove event handlers
_display displayRemoveEventHandler ["MouseButtonDown", cxp_3dPreview_evh_down];
cxp_3dPreview_evh_down = nil;
_display displayRemoveEventHandler ["MouseButtonUp", cxp_3dPreview_evh_up];
cxp_3dPreview_evh_up = nil;
_display displayRemoveEventHandler ["MouseMoving", cxp_3dPreview_evh_move];
cxp_3dPreview_evh_move = nil;
_display displayRemoveEventHandler ["MouseZChanged", cxp_3dPreview_evh_zoom];
cxp_3dPreview_evh_zoom = nil;