package steam;

#if cpp
@:buildXml('<include name="${haxelib:hxsteam}/project/Build.xml" />')
@:headerCode('
    #include <steam/steam_api_flat.h>
')
@:unreflective
#end
class UserStats {
    /**
     * Checks whether an achievement is unlocked.
     * @param name The identifier of the achievement in the Steamworks partner site.
     * @return True if unlocked, false otherwise.
     */
    public static function getAchievement(name:String):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        var achieved:Bool = false;
        untyped __cpp__("
            if (SteamAPI_SteamUserStats() != nullptr) {
                bool bAchieved = false;
                if (SteamAPI_ISteamUserStats_GetAchievement(SteamAPI_SteamUserStats(), {0}.c_str(), &bAchieved)) {
                    {1} = bAchieved;
                }
            }
        ", name, achieved);
        return achieved;
        #else
        return false;
        #end
    }

    /**
     * Unlocks an achievement and optionally saves/notifies immediately.
     * @param name The identifier of the achievement.
     * @param autoStore Whether to call `storeStats()` immediately to trigger the popup overlay notification (default: true).
     * @return True if successfully set.
     */
    public static function setAchievement(name:String, autoStore:Bool = true):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        var success:Bool = untyped __cpp__("SteamAPI_SteamUserStats() != nullptr && SteamAPI_ISteamUserStats_SetAchievement(SteamAPI_SteamUserStats(), {0}.c_str())", name);
        if (success && autoStore) {
            storeStats();
        }
        return success;
        #else
        return false;
        #end
    }

    /**
     * Clears / locks an achievement.
     * @param name The identifier of the achievement.
     * @param autoStore Whether to call `storeStats()` immediately (default: true).
     * @return True if successfully cleared.
     */
    public static function clearAchievement(name:String, autoStore:Bool = true):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        var success:Bool = untyped __cpp__("SteamAPI_SteamUserStats() != nullptr && SteamAPI_ISteamUserStats_ClearAchievement(SteamAPI_SteamUserStats(), {0}.c_str())", name);
        if (success && autoStore) {
            storeStats();
        }
        return success;
        #else
        return false;
        #end
    }

    /**
     * Updates an achievement's progress notification popup.
     */
    public static function indicateAchievementProgress(name:String, curProgress:Int, maxProgress:Int):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        return untyped __cpp__("SteamAPI_SteamUserStats() != nullptr && SteamAPI_ISteamUserStats_IndicateAchievementProgress(SteamAPI_SteamUserStats(), {0}.c_str(), (uint32){1}, (uint32){2})", name, curProgress, maxProgress);
        #else
        return false;
        #end
    }

    /**
     * Retrieves an integer statistic.
     */
    public static function getStatInt(name:String):Int {
        #if cpp
        if (!Steam.initialized) return 0;
        var val:Int = 0;
        untyped __cpp__("
            if (SteamAPI_SteamUserStats() != nullptr) {
                int32 nData = 0;
                if (SteamAPI_ISteamUserStats_GetStatInt32(SteamAPI_SteamUserStats(), {0}.c_str(), &nData)) {
                    {1} = (int)nData;
                }
            }
        ", name, val);
        return val;
        #else
        return 0;
        #end
    }

    /**
     * Sets an integer statistic.
     * @param name The stat name.
     * @param value The new stat value.
     * @param autoStore Whether to call `storeStats()` immediately (default: false).
     */
    public static function setStatInt(name:String, value:Int, autoStore:Bool = false):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        var success:Bool = untyped __cpp__("SteamAPI_SteamUserStats() != nullptr && SteamAPI_ISteamUserStats_SetStatInt32(SteamAPI_SteamUserStats(), {0}.c_str(), (int32){1})", name, value);
        if (success && autoStore) {
            storeStats();
        }
        return success;
        #else
        return false;
        #end
    }

    /**
     * Retrieves a float statistic.
     */
    public static function getStatFloat(name:String):Float {
        #if cpp
        if (!Steam.initialized) return 0.0;
        var val:Float = 0.0;
        untyped __cpp__("
            if (SteamAPI_SteamUserStats() != nullptr) {
                float fData = 0.0f;
                if (SteamAPI_ISteamUserStats_GetStatFloat(SteamAPI_SteamUserStats(), {0}.c_str(), &fData)) {
                    {1} = (double)fData;
                }
            }
        ", name, val);
        return val;
        #else
        return 0.0;
        #end
    }

    /**
     * Sets a float statistic.
     * @param name The stat name.
     * @param value The new float value.
     * @param autoStore Whether to call `storeStats()` immediately (default: false).
     */
    public static function setStatFloat(name:String, value:Float, autoStore:Bool = false):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        var success:Bool = untyped __cpp__("SteamAPI_SteamUserStats() != nullptr && SteamAPI_ISteamUserStats_SetStatFloat(SteamAPI_SteamUserStats(), {0}.c_str(), (float){1})", name, value);
        if (success && autoStore) {
            storeStats();
        }
        return success;
        #else
        return false;
        #end
    }

    /**
     * Stores the current data (achievements and stats) on the Steam server.
     * This triggers the in-game Steam Overlay achievement notification popup.
     */
    public static function storeStats():Bool {
        #if cpp
        if (!Steam.initialized) return false;
        var res:Bool = untyped __cpp__("SteamAPI_SteamUserStats() != nullptr && SteamAPI_ISteamUserStats_StoreStats(SteamAPI_SteamUserStats())");
        // Also run callbacks to immediately dispatch events
        Steam.update();
        return res;
        #else
        return false;
        #end
    }

    /**
     * Resets all stats (and optionally achievements).
     */
    public static function resetAllStats(achievementsToo:Bool = false):Bool {
        #if cpp
        if (!Steam.initialized) return false;
        var res:Bool = untyped __cpp__("SteamAPI_SteamUserStats() != nullptr && SteamAPI_ISteamUserStats_ResetAllStats(SteamAPI_SteamUserStats(), {0})", achievementsToo);
        if (res) {
            storeStats();
        }
        return res;
        #else
        return false;
        #end
    }

    /**
     * Returns the number of achievements configured for this game.
     */
    public static function getNumAchievements():Int {
        #if cpp
        if (!Steam.initialized) return 0;
        return untyped __cpp__("SteamAPI_SteamUserStats() != nullptr ? (int)SteamAPI_ISteamUserStats_GetNumAchievements(SteamAPI_SteamUserStats()) : 0");
        #else
        return 0;
        #end
    }

    /**
     * Returns the name of an achievement by index.
     */
    public static function getAchievementName(index:Int):String {
        #if cpp
        if (!Steam.initialized) return "";
        var res:cpp.ConstCharStar = untyped __cpp__("SteamAPI_SteamUserStats() != nullptr ? SteamAPI_ISteamUserStats_GetAchievementName(SteamAPI_SteamUserStats(), (uint32){0}) : \"\"", index);
        return res != null ? (res : String) : "";
        #else
        return "";
        #end
    }

    /**
     * Returns a display attribute for an achievement (e.g. "name", "desc", "hidden").
     */
    public static function getAchievementDisplayAttribute(name:String, key:String):String {
        #if cpp
        if (!Steam.initialized) return "";
        var res:cpp.ConstCharStar = untyped __cpp__("SteamAPI_SteamUserStats() != nullptr ? SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute(SteamAPI_SteamUserStats(), {0}.c_str(), {1}.c_str()) : \"\"", name, key);
        return res != null ? (res : String) : "";
        #else
        return "";
        #end
    }
}
