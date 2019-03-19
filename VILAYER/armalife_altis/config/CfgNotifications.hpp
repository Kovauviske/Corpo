class CfgNotifications {
    class MedicalRequestEmerg {
        title = "$STR_MedicalRequestEmerg_Title";
        iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
        description = "%1";
        duration = 5;
        priority = 7;
    };

    class DeliveryAssigned {
        title = "$STR_DeliveryAssigned_Title";
        iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
        description = "%1";
        duration = 10;
        priority = 5;
    };

    class DeliveryFailed {
        title = "$STR_DeliveryFailed_Title";
        iconPicture = "\A3\ui_f\data\map\mapcontrol\taskiconfailed_ca.paa";
        description = "%1";
        duration = 7;
        priority = 7;
    };

    class DeliverySucceeded {
        title = "$STR_DeliverySucceeded_Title";
        iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcondone_ca.paa";
        description = "%1";
        duration = 6;
        priority = 8;
    };

    class TextMessage {
        title = "$STR_TextMessage_Title";
        iconPicture = "icons\ico_messageNew.paa";
        description = "%1";
        duration = 10;
        priority = 10;
    };

    class PoliceDispatch {
        title = "$STR_PoliceDispatch_Title";
        iconPicture = "icons\ico_messagePolice.paa";
        description = "%1";
        duration = 10;
        priority = 8;
    };

    class BountyNotify {
        title = "$STR_BountyFy_Title";
        iconPicture = "icons\ico_messagePolice.paa";
        description = "%1";
        duration = 10;
        priority = 8;
    };
	
	class SafezoneNotifyIn {
        title = "$STR_SAFEZONE_NTFY_Title";
        iconPicture = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        description = "%1";
		color[] = {0,1,0,1};
        duration = 3;
        priority = 6;
	};
	
	class SafezoneNotifyOut {
        title = "$STR_SAFEZONE_NTFY_Title";
        iconPicture = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        description = "%1";
		color[] = {1,0.906,0,1};
        duration = 3;
        priority = 6;
	};
};