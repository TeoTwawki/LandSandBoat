-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Sanraku
-- Type: Zeni NM pop item and trophy management.
-- !pos -125.724 0.999 22.136 50
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.znm.sanraku.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.znm.sanraku.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.znm.sanraku.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.znm.sanraku.onEventFinish(player, csid, option, npc)
end

return entity
