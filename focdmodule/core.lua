require("ts3defs")
require("ts3errors")

function teleport(serverConnectionHandlerID, menuType, menuItemID, partial, selectedItemID)

    -- Get Self ID
    local myClientID, error = ts3.getClientID(serverConnectionHandlerID)

    if error == ts3errors.ERROR_ok then
	-- Get which channel we are in
	local myChannelID, error = ts3.getChannelOfClient(serverConnectionHandlerID, myClientID)
	
	if error == ts3errors.ERROR_ok then
	    ts3.printMessageToCurrentTab(" partial = " .. partial)
	    
	    if partial == "true" then
		clients, error = ts3.getChannelClientList(serverConnectionHandlerID, selectedItemID)
	    else 
		clients, error = ts3.getClientList(serverConnectionHandlerID)
	    end
	    
	    if error == ts3errors.ERROR_ok then
		local counter = 0
		local password = ""
		
		if clients ~= nil then
		    ts3.printMessageToCurrentTab("#clients = " .. #clients .. " partial = " .. partial)
		    for i=1, #clients do
			if clients[i] ~= myClientID then
			    local error = ts3.requestClientMove(serverConnectionHandlerID, clients[i], myChannelID, password)
			    if error == ts3errors.ERROR_ok then
				counter = counter + 1
			    end
			end
		    end
		    if counter ~= 0 then
			ts3.printMessageToCurrentTab("Am teleportat " .. counter .." useri")
		    end
		end
	    end
	end
    end
end