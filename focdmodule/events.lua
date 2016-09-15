
local MenuIDs = {
	CONTEXT_ID_TITLE  = 1,
	CONTEXT_ID_TELEPORT_PARTIAL  = 2,
	CONTEXT_ID_TELEPORT_TOTAL = 3
}
local MenuText = {    
    CONTEXT_ID_TITLE             = ">> FOC-D Admin:",
    CONTEXT_ID_TELEPORT_PARTIAL  = "Transfera membrii din camera la mine",
    CONTEXT_ID_TELEPORT_TOTAL    = "Transfera pe TOTI la mine"
}

local moduleMenuItemID = 0

local function onMenuItemEvent(serverConnectionHandlerID, menuType, menuItemID, selectedItemID)
	
	
	if menuType == ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CHANNEL then
	  
	    if menuItemID == MenuIDs.CONTEXT_ID_TELEPORT_PARTIAL then
		teleport(serverConnectionHandlerID, menuType, menuItemID, 'true', selectedItemID)
		return
	    end
	    
	    if menuItemID == MenuIDs.CONTEXT_ID_TELEPORT_TOTAL then
		teleport(serverConnectionHandlerID, menuType, menuItemID, 'false', selectedItemID)
		return 
	    end
	end
	
end

focdmodule_events = {
    MenuIDs = MenuIDs,
    MenuText = MenuText,
    moduleMenuItemID = moduleMenuItemID,	
    onMenuItemEvent = onMenuItemEvent
}
