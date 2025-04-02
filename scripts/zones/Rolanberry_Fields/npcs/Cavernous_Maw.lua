-----------------------------------
-- Area: Rolanberry Fields
--  NPC: Cavernous Maw
-- !pos -198 8 361 110
-- Teleports Players to Rolanberry Fields [S]
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
