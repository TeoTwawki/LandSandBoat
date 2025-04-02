-----------------------------------
-- Area: Pashhow Marshlands
--  NPC: Cavernous Maw
-- !pos 418 25 27 109
-- Teleports Players to Pashhow Marshlands [S]
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
