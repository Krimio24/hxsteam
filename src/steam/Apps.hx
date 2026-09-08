package steam;

#if cpp
@:buildXml('<include name="${haxelib:hxsteam}/project/Build.xml" />')
@:headerCode('
    #include <steam/steam_api_flat.h>
')
@:unreflective
#end
class Apps {
    public static function isSubscribed():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr && SteamAPI_ISteamApps_BIsSubscribed(SteamAPI_SteamApps())");
        #else
        return false;
        #end
    }

    public static function isLowViolence():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr && SteamAPI_ISteamApps_BIsLowViolence(SteamAPI_SteamApps())");
        #else
        return false;
        #end
    }

    public static function isCybercafe():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr && SteamAPI_ISteamApps_BIsCybercafe(SteamAPI_SteamApps())");
        #else
        return false;
        #end
    }

    public static function isVACBanned():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr && SteamAPI_ISteamApps_BIsVACBanned(SteamAPI_SteamApps())");
        #else
        return false;
        #end
    }

    public static function getCurrentGameLanguage():String {
        #if cpp
        if (!Steam.initialized) return "";
        var lang:cpp.ConstCharStar = untyped __cpp__("SteamAPI_SteamApps() != nullptr ? SteamAPI_ISteamApps_GetCurrentGameLanguage(SteamAPI_SteamApps()) : \"\"");
        return lang != null ? (lang : String) : "";
        #else
        return "";
        #end
    }

    public static function getAvailableGameLanguages():String {
        #if cpp
        if (!Steam.initialized) return "";
        var langs:cpp.ConstCharStar = untyped __cpp__("SteamAPI_SteamApps() != nullptr ? SteamAPI_ISteamApps_GetAvailableGameLanguages(SteamAPI_SteamApps()) : \"\"");
        return langs != null ? (langs : String) : "";
        #else
        return "";
        #end
    }

    public static function isSubscribedApp(appId:Int):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr && SteamAPI_ISteamApps_BIsSubscribedApp(SteamAPI_SteamApps(), (AppId_t){0})", appId);
        #else
        return false;
        #end
    }

    public static function isDLCInstalled(appId:Int):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr && SteamAPI_ISteamApps_BIsDlcInstalled(SteamAPI_SteamApps(), (AppId_t){0})", appId);
        #else
        return false;
        #end
    }

    public static function getDLCCount():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr ? SteamAPI_ISteamApps_GetDLCCount(SteamAPI_SteamApps()) : 0");
        #else
        return 0;
        #end
    }

    public static function isAppInstalled(appId:Int):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr && SteamAPI_ISteamApps_BIsAppInstalled(SteamAPI_SteamApps(), (AppId_t){0})", appId);
        #else
        return false;
        #end
    }

    public static function installDLC(appId:Int):Void {
        #if cpp
        if (!Steam.initialized) return;
        untyped __cpp__("if (SteamAPI_SteamApps() != nullptr) SteamAPI_ISteamApps_InstallDLC(SteamAPI_SteamApps(), (AppId_t){0});", appId);
        #end
    }

    public static function uninstallDLC(appId:Int):Void {
        #if cpp
        if (!Steam.initialized) return;
        untyped __cpp__("if (SteamAPI_SteamApps() != nullptr) SteamAPI_ISteamApps_UninstallDLC(SteamAPI_SteamApps(), (AppId_t){0});", appId);
        #end
    }

    public static function markContentCorrupt(missingFilesOnly:Bool = false):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr && SteamAPI_ISteamApps_MarkContentCorrupt(SteamAPI_SteamApps(), {0})", missingFilesOnly);
        #else
        return false;
        #end
    }

    public static function isSubscribedFromFreeWeekend():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamApps() != nullptr && SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend(SteamAPI_SteamApps())");
        #else
        return false;
        #end
    }

    public static function getCurrentBetaName():String {
        #if cpp
        if (!Steam.initialized) return "";
        var beta:String = "";
        untyped __cpp__("
            if (SteamAPI_SteamApps() != nullptr) {
                char buf[256];
                if (SteamAPI_ISteamApps_GetCurrentBetaName(SteamAPI_SteamApps(), buf, sizeof(buf))) {
                    {0} = String(buf);
                }
            }
        ", beta);
        return beta;
        #else
        return "";
        #end
    }
}
