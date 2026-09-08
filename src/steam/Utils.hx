package steam;

#if cpp
@:buildXml('<include name="${haxelib:hxsteam}/project/Build.xml" />')
@:headerCode('
    #include <steam/steam_api_flat.h>
')
@:unreflective
#end
class Utils {
    public static function getSecondsSinceAppActive():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr ? (int)SteamAPI_ISteamUtils_GetSecondsSinceAppActive(SteamAPI_SteamUtils()) : 0");
        #else
        return 0;
        #end
    }

    public static function getSecondsSinceComputerActive():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr ? (int)SteamAPI_ISteamUtils_GetSecondsSinceComputerActive(SteamAPI_SteamUtils()) : 0");
        #else
        return 0;
        #end
    }

    public static function getConnectedUniverse():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr ? (int)SteamAPI_ISteamUtils_GetConnectedUniverse(SteamAPI_SteamUtils()) : 0");
        #else
        return 0;
        #end
    }

    public static function getServerRealTime():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr ? (int)SteamAPI_ISteamUtils_GetServerRealTime(SteamAPI_SteamUtils()) : 0");
        #else
        return 0;
        #end
    }

    public static function getIPCountry():String {
        #if cpp
        if (!Steam.initialized) return "";
        var country:cpp.ConstCharStar = untyped __cpp__("SteamAPI_SteamUtils() != nullptr ? SteamAPI_ISteamUtils_GetIPCountry(SteamAPI_SteamUtils()) : \"\"");
        return country != null ? (country : String) : "";
        #else
        return "";
        #end
    }

    public static function getImageWidth(image:Int):Int {
        #if cpp
        if (!Steam.initialized) return 0;
        var width:Int = 0;
        untyped __cpp__("
            if (SteamAPI_SteamUtils() != nullptr) {
                uint32 uWidth = 0, uHeight = 0;
                if (SteamAPI_ISteamUtils_GetImageSize(SteamAPI_SteamUtils(), {0}, &uWidth, &uHeight)) {
                    {1} = (int)uWidth;
                }
            }
        ", image, width);
        return width;
        #else
        return 0;
        #end
    }

    public static function getImageHeight(image:Int):Int {
        #if cpp
        if (!Steam.initialized) return 0;
        var height:Int = 0;
        untyped __cpp__("
            if (SteamAPI_SteamUtils() != nullptr) {
                uint32 uWidth = 0, uHeight = 0;
                if (SteamAPI_ISteamUtils_GetImageSize(SteamAPI_SteamUtils(), {0}, &uWidth, &uHeight)) {
                    {1} = (int)uHeight;
                }
            }
        ", image, height);
        return height;
        #else
        return 0;
        #end
    }

    public static function getAppID():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr ? (int)SteamAPI_ISteamUtils_GetAppID(SteamAPI_SteamUtils()) : 0");
        #else
        return 0;
        #end
    }

    public static function isOverlayEnabled():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr && SteamAPI_ISteamUtils_IsOverlayEnabled(SteamAPI_SteamUtils())");
        #else
        return false;
        #end
    }

    public static function isSteamRunningInVR():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr && SteamAPI_ISteamUtils_IsSteamRunningInVR(SteamAPI_SteamUtils())");
        #else
        return false;
        #end
    }

    public static function isSteamInBigPictureMode():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr && SteamAPI_ISteamUtils_IsSteamInBigPictureMode(SteamAPI_SteamUtils())");
        #else
        return false;
        #end
    }

    public static function isSteamChinaLauncher():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr && SteamAPI_ISteamUtils_IsSteamChinaLauncher(SteamAPI_SteamUtils())");
        #else
        return false;
        #end
    }

    public static function dismissFloatingGamepadTextInput():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamUtils() != nullptr && SteamAPI_ISteamUtils_DismissFloatingGamepadTextInput(SteamAPI_SteamUtils())");
        #else
        return false;
        #end
    }

    public static function startVRDashboard():Void {
        #if cpp
        if (!Steam.initialized) return;
        untyped __cpp__("if (SteamAPI_SteamUtils() != nullptr) SteamAPI_ISteamUtils_StartVRDashboard(SteamAPI_SteamUtils());");
        #end
    }
}
