-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_vadleany (???)
-- Spawns Vadleany
-- !pos -56 1 123 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.VADLEANY, { invaderXim.item.LADYBIRD_LEAF })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.LADYBIRD_LEAF })
end

return entity
