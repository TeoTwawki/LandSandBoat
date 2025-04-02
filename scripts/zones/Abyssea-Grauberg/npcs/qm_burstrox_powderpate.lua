-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_burstrox_powderpate (???)
-- Spawns Burstrox Powderpate
-- !pos 396 40 -436 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.BURSTROX_POWDERPATE, { invaderXim.item.LENGTH_OF_GOBLIN_ROPE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.LENGTH_OF_GOBLIN_ROPE })
end

return entity
