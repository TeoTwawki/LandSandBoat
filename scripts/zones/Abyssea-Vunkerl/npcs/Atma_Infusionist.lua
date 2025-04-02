-----------------------------------
-- Zone: Abyssea - Vunkerl
--  NPC: Atma Infusionist
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.atma.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.atma.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.atma.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.atma.onEventFinish(player, csid, option, npc)
end

return entity
