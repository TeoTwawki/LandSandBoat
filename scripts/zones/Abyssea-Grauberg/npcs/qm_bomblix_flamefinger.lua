-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_bomblix_flamefinger (???)
-- Spawns Bomblix Flamefinger
-- !pos 555 23 -317 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.BOMBLIX_FLAMEFINGER, { invaderXim.item.JAR_OF_GOBLIN_GUNPOWDER, invaderXim.item.JAR_OF_GOBLIN_OIL })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.JAR_OF_GOBLIN_GUNPOWDER, invaderXim.item.JAR_OF_GOBLIN_OIL })
end

return entity
