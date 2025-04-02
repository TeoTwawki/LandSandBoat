-----------------------------------
-- Announce when a player logs in
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('announce_player_login')

m:addOverride('invaderXim.player.onGameIn', function(player, firstLogin, zoning)
    super(player, firstLogin, zoning)

    if not zoning then
        local decoratedMessage = string.format('Player %s has logged in.', player:getName())

        -- Sends announcement via ZMQ to all processes and zones
        player:printToArea(decoratedMessage, invaderXim.msg.channel.SYSTEM_3, invaderXim.msg.area.SYSTEM, '', true)
    end
end)

return m
