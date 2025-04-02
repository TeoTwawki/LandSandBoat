-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Ryo
-- Type: ZNM assistant
-- !pos -127.086 0.999 22.693 50
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.znm.ryo.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.znm.ryo.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.znm.ryo.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.znm.ryo.onEventFinish(player, csid, option, npc)
end

return entity
