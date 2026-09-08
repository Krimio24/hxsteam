package steam;

#if cpp
@:buildXml('<include name="${haxelib:hxsteam}/project/Build.xml" />')
@:include('steam/steam_api.h')
@:unreflective
#end
extern class Api {
    @:native("SteamAPI_RestartAppIfNecessary")
    public static function restartAppIfNecessary(unOwnAppID:cpp.UInt32):Bool;

    @:native("SteamAPI_Init")
    public static function init():Bool;

    @:native("SteamAPI_Shutdown")
    public static function shutdown():Void;

    @:native("SteamAPI_RunCallbacks")
    public static function runCallbacks():Void;

    @:native("SteamAPI_IsSteamRunning")
    public static function isSteamRunning():Bool;
}