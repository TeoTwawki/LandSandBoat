-----------------------------------
-- Zone: Abyssea - Konschtat
--  NPC: Atma Fabricant
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.atmaFabricant.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.atmaFabricant.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.atmaFabricant.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.atmaFabricant.onEventFinish(player, csid, option, npc)
end

return entity
