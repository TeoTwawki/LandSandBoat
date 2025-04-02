-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: Cavernous Maw
-- Teleports Players to Sauromugue_Champaign_S
-- !pos 369 8 -227 120
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
