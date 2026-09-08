package steam;

#if cpp
@:buildXml('<include name="${haxelib:hxsteam}/project/Build.xml" />')
@:headerCode('
    #include <steam/steam_api_flat.h>
')
@:unreflective
#end
class RemoteStorage {
    public static function fileWrite(file:String, data:String):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr && SteamAPI_ISteamRemoteStorage_FileWrite(SteamAPI_SteamRemoteStorage(), {0}.c_str(), {1}.c_str(), {1}.length)", file, data);
        #else
        return false;
        #end
    }

    public static function fileRead(file:String):String {
        #if cpp
        if (!Steam.initialized) return "";
        var content:String = "";
        untyped __cpp__("
            if (SteamAPI_SteamRemoteStorage() != nullptr && SteamAPI_ISteamRemoteStorage_FileExists(SteamAPI_SteamRemoteStorage(), {0}.c_str())) {
                int32 size = SteamAPI_ISteamRemoteStorage_GetFileSize(SteamAPI_SteamRemoteStorage(), {0}.c_str());
                if (size > 0) {
                    char *buf = new char[size + 1];
                    int32 bytesRead = SteamAPI_ISteamRemoteStorage_FileRead(SteamAPI_SteamRemoteStorage(), {0}.c_str(), buf, size);
                    if (bytesRead >= 0) {
                        buf[bytesRead] = '\\0';
                        {1} = String(buf, bytesRead);
                    }
                    delete[] buf;
                }
            }
        ", file, content);
        return content;
        #else
        return "";
        #end
    }

    public static function fileExists(file:String):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr && SteamAPI_ISteamRemoteStorage_FileExists(SteamAPI_SteamRemoteStorage(), {0}.c_str())", file);
        #else
        return false;
        #end
    }

    public static function fileDelete(file:String):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr && SteamAPI_ISteamRemoteStorage_FileDelete(SteamAPI_SteamRemoteStorage(), {0}.c_str())", file);
        #else
        return false;
        #end
    }

    public static function fileForget(file:String):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr && SteamAPI_ISteamRemoteStorage_FileForget(SteamAPI_SteamRemoteStorage(), {0}.c_str())", file);
        #else
        return false;
        #end
    }

    public static function filePersisted(file:String):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr && SteamAPI_ISteamRemoteStorage_FilePersisted(SteamAPI_SteamRemoteStorage(), {0}.c_str())", file);
        #else
        return false;
        #end
    }

    public static function getFileSize(file:String):Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr ? (int)SteamAPI_ISteamRemoteStorage_GetFileSize(SteamAPI_SteamRemoteStorage(), {0}.c_str()) : 0", file);
        #else
        return 0;
        #end
    }

    public static function getFileTimestamp(file:String):Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr ? (int)SteamAPI_ISteamRemoteStorage_GetFileTimestamp(SteamAPI_SteamRemoteStorage(), {0}.c_str()) : 0", file);
        #else
        return 0;
        #end
    }

    public static function getFileCount():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr ? (int)SteamAPI_ISteamRemoteStorage_GetFileCount(SteamAPI_SteamRemoteStorage()) : 0");
        #else
        return 0;
        #end
    }

    public static function isCloudEnabledForAccount():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr && SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount(SteamAPI_SteamRemoteStorage())");
        #else
        return false;
        #end
    }

    public static function isCloudEnabledForApp():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamRemoteStorage() != nullptr && SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp(SteamAPI_SteamRemoteStorage())");
        #else
        return false;
        #end
    }

    public static function setCloudEnabledForApp(enabled:Bool):Void {
        #if cpp
        if (!Steam.initialized) return;
        untyped __cpp__("if (SteamAPI_SteamRemoteStorage() != nullptr) SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp(SteamAPI_SteamRemoteStorage(), {0});", enabled);
        #end
    }
}
