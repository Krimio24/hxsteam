package steam;

#if cpp
@:buildXml('<include name="${haxelib:hxsteam}/project/Build.xml" />')
@:headerCode('
    #include <steam/steam_api_flat.h>
')
@:unreflective
#end
class User {
    public static function getSteamID():String {
        #if cpp
        if (!Steam.initialized) return "";
        var idStr:String = "";
        untyped __cpp__("
            if (SteamAPI_SteamUser() != nullptr) {
                uint64_steamid rawId = SteamAPI_ISteamUser_GetSteamID(SteamAPI_SteamUser());
                char buf[32];
                snprintf(buf, sizeof(buf), \"%llu\", (unsigned long long)rawId);
                {0} = String(buf);
            }
        ", idStr);
        return idStr;
        #else
        return "";
        #end
    }

    public static function loggedOn():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamUser() != nullptr && SteamAPI_ISteamUser_BLoggedOn(SteamAPI_SteamUser())");
        #else
        return false;
        #end
    }

    public static function getPlayerSteamLevel():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamUser() != nullptr ? SteamAPI_ISteamUser_GetPlayerSteamLevel(SteamAPI_SteamUser()) : 0");
        #else
        return 0;
        #end
    }

    public static function getBadgeLevel(series:Int = 1, foil:Bool = false):Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamUser() != nullptr ? SteamAPI_ISteamUser_GetGameBadgeLevel(SteamAPI_SteamUser(), {0}, {1}) : 0", series, foil);
        #else
        return 0;
        #end
    }
}
