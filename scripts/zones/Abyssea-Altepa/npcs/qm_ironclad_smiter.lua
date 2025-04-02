-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_ironclad_smiter (???)
-- Spawns Ironclad Smiter
-- !pos -744 -17 -696 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.IRONCLAD_SMITER, { invaderXim.item.VIAL_OF_TABLILLA_MERCURY, invaderXim.item.SMOLDERING_ARM })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.VIAL_OF_TABLILLA_MERCURY, invaderXim.item.SMOLDERING_ARM })
end

return entity
