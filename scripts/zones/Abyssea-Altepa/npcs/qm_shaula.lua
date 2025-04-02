-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_shaula (???)
-- Spawns Shaula
-- !pos -71 0 408 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.SHAULA, { invaderXim.item.VIAL_OF_VADLEANY_FLUID, invaderXim.item.HIGH_QUALITY_SCORPION_CLAW })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.VIAL_OF_VADLEANY_FLUID, invaderXim.item.HIGH_QUALITY_SCORPION_CLAW })
end

return entity
