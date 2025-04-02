-----------------------------------
require('scripts/events/handler')
-----------------------------------
xi = xi or {}
invaderXim.server = invaderXim.server or {}

invaderXim.server.onServerStart = function()
    invaderXim.events.handler.checkSeasonalEvents()
end

invaderXim.server.onJSTMidnight = function()
    invaderXim.events.handler.checkSeasonalEvents()
end

invaderXim.server.onTimeServerTick = function()
end

-- Message for use with SmallPacket0x04B
invaderXim.server.getServerMessage = function(language)
    local serverMessage = ''

    if language == invaderXim.language.ENGLISH then
        serverMessage = invaderXim.settings.main.SERVER_MESSAGE

        if invaderXim.settings.main.ENABLE_TRUST_ALTER_EGO_EXTRAVAGANZA_ANNOUNCE == 1 then
            serverMessage = serverMessage .. invaderXim.settings.main.TRUST_ALTER_EGO_EXTRAVAGANZA_MESSAGE
        end

        if invaderXim.settings.main.ENABLE_TRUST_ALTER_EGO_EXPO_ANNOUNCE == 1 then
            serverMessage = serverMessage .. invaderXim.settings.main.TRUST_ALTER_EGO_EXPO_MESSAGE
        end
    end

    return serverMessage
end

invaderXim.server.setExplorerMoogles = function(moogleId)
    if invaderXim.settings.main.EXPLORER_MOOGLE_LV ~= 0 then
        local npc = GetNPCByID(moogleId)
        if npc == nil then
            printf('SetExplorerMoogles: Error trying to load undefined npc (%d)', moogleId)
        else
            npc:setStatus(0)
        end
    end
end

return invaderXim.server
