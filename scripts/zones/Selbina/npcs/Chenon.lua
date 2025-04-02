-----------------------------------
-- Area: Selbina
--  NPC: Chenon
-- Type: Fish Ranking NPC
-- !pos -13.472 -8.287 9.497 248
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.fishingContest.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.fishingContest.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.fishingContest.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.fishingContest.onEventFinish(player, csid, option, npc)
end

return entity
