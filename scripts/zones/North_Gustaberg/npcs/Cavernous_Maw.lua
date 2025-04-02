-----------------------------------
-- Area: North Gustaberg
--  NPC: Cavernous Maw
-- !pos 466 0 479 106
-- Teleports Players to North Gustaberg [S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.maws.onTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.maws.onEventFinish(player, csid, option, npc)
end

return entity
