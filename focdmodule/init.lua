--
-- FOC-D Admin
-- Version: 1.0
-- Author: SirLucasIV
-- Website: http://piroman.isteam.ro
--

require("ts3init")
require("focdmodule/events")
require("focdmodule/core")  

local MODULE_NAME = "focdmodule"
local function createMenus(moduleMenuItemID)
	
	focdmodule_events.moduleMenuItemID = moduleMenuItemID	
	return {
	    {ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CHANNEL, focdmodule_events.MenuIDs.CONTEXT_ID_TITLE,            focdmodule_events.MenuText.CONTEXT_ID_TITLE, ""},
	    {ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CHANNEL, focdmodule_events.MenuIDs.CONTEXT_ID_TELEPORT_PARTIAL, focdmodule_events.MenuText.CONTEXT_ID_TELEPORT_PARTIAL, ""},
	    {ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CHANNEL, focdmodule_events.MenuIDs.CONTEXT_ID_TELEPORT_TOTAL,   focdmodule_events.MenuText.CONTEXT_ID_TELEPORT_TOTAL, ""}
	}
end

local registeredEvents = {
	createMenus = createMenus,	
	onMenuItemEvent = focdmodule_events.onMenuItemEvent
}

ts3RegisterModule(MODULE_NAME, registeredEvents)
