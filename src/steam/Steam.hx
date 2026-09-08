package steam;

import steam.Api;

#if cpp
@:buildXml('<include name="${haxelib:hxsteam}/project/Build.xml" />')
@:include('steam/steam_api.h')
@:unreflective
#end
class Steam {
    public static var initialized(default, null):Bool = false;
    public static var gameid(default, null):Int = 480;

    /**
     * Initializes the Steamworks API and sets up environment variables.
     * @param appId The Steam App ID for the application (e.g. 480 for Spacewar test).
     * @return True if initialized successfully, false otherwise.
     */
    public static function init(appId:Int):Bool {
        gameid = appId;

        if (initialized) return true;

        #if sys
        Sys.putEnv("SteamAppId", Std.string(gameid));
        Sys.putEnv("SteamGameId", Std.string(gameid));
        #end

        #if cpp
        if (Api.restartAppIfNecessary(gameid)) {
            #if sys
            Sys.exit(0);
            #end
            return false;
        }

        try {
            initialized = Api.init();
        } catch (e:Dynamic) {
            initialized = false;
        }

        #if lime
        if (initialized && lime.app.Application.current != null) {
            lime.app.Application.current.onUpdate.add(function(_) {
                update();
            });
        }
        #end
        #end

        return initialized;
    }

    /**
     * Dispatches callbacks to registered listeners. Should be called periodically (e.g. every frame).
     */
    public static function update():Void {
        #if cpp
        if (initialized) {
            Api.runCallbacks();
        }
        #end
    }

    /**
     * Alias for `update()`.
     */
    public static inline function runCallbacks():Void {
        update();
    }

    /**
     * Shuts down the Steamworks API.
     */
    public static function stop():Void {
        #if cpp
        if (initialized) {
            Api.shutdown();
            initialized = false;
        }
        #end
    }

    /**
     * Alias for `stop()`.
     */
    public static inline function shutdown():Void {
        stop();
    }

    /**
     * Checks if Steam is currently running.
     */
    public static function isSteamRunning():Bool {
        #if cpp
        return Api.isSteamRunning();
        #else
        return false;
        #end
    }

    /**
     * Checks if your executable was launched through Steam.
     */
    public static function restartAppIfNecessary(appId:Int):Bool {
        #if cpp
        return Api.restartAppIfNecessary(appId);
        #else
        return false;
        #end
    }
}