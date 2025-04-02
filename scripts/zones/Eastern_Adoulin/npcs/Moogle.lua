-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Moogle
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.moghouse.moogleTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.moghouse.moogleTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.moghouse.moogleEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.moghouse.moogleEventFinish(player, csid, option, npc)
end

return entity
