package steam;

#if cpp
@:buildXml('<include name="${haxelib:hxsteam}/project/Build.xml" />')
@:headerCode('
    #include <steam/steam_api_flat.h>
')
@:unreflective
#end
class Friends {
    public static function getPersonaName():String {
        #if cpp
        if (!Steam.initialized) return "";
        var name:cpp.ConstCharStar = untyped __cpp__("SteamAPI_SteamFriends() != nullptr ? SteamAPI_ISteamFriends_GetPersonaName(SteamAPI_SteamFriends()) : \"\"");
        return name != null ? (name : String) : "";
        #else
        return "";
        #end
    }

    public static function getPersonaState():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamFriends() != nullptr ? (int)SteamAPI_ISteamFriends_GetPersonaState(SteamAPI_SteamFriends()) : 0");
        #else
        return 0;
        #end
    }

    public static function activateGameOverlay(dialog:String):Void {
        #if cpp
        if (!Steam.initialized) return;
        untyped __cpp__("if (SteamAPI_SteamFriends() != nullptr) SteamAPI_ISteamFriends_ActivateGameOverlay(SteamAPI_SteamFriends(), {0}.c_str());", dialog);
        #end
    }

    public static function activateGameOverlayToWebPage(url:String):Void {
        #if cpp
        if (!Steam.initialized) return;
        untyped __cpp__("if (SteamAPI_SteamFriends() != nullptr) SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(SteamAPI_SteamFriends(), {0}.c_str(), k_EActivateGameOverlayToWebPageMode_Default);", url);
        #end
    }

    public static function activateGameOverlayToStore(appId:Int, flag:Int = 0):Void {
        #if cpp
        if (!Steam.initialized) return;
        untyped __cpp__("if (SteamAPI_SteamFriends() != nullptr) SteamAPI_ISteamFriends_ActivateGameOverlayToStore(SteamAPI_SteamFriends(), (AppId_t){0}, (EOverlayToStoreFlag){1});", appId, flag);
        #end
    }

    public static function setRichPresence(key:String, value:String):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamFriends() != nullptr && SteamAPI_ISteamFriends_SetRichPresence(SteamAPI_SteamFriends(), {0}.c_str(), {1}.c_str())", key, value);
        #else
        return false;
        #end
    }

    public static function clearRichPresence():Void {
        #if cpp
        if (!Steam.initialized) return;
        untyped __cpp__("if (SteamAPI_SteamFriends() != nullptr) SteamAPI_ISteamFriends_ClearRichPresence(SteamAPI_SteamFriends());");
        #end
    }

    public static function getFriendCount(flag:Int = 4):Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamFriends() != nullptr ? SteamAPI_ISteamFriends_GetFriendCount(SteamAPI_SteamFriends(), {0}) : 0", flag);
        #else
        return 0;
        #end
    }
}
