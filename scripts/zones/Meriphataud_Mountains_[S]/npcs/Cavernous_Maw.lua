-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: Cavernous Maw
-- !pos 597 -32 279 97
-- Teleports Players to Meriphataud Mountains
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
