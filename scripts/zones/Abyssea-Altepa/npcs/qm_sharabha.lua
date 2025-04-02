-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_sharabha (???)
-- Spawns Sharabha
-- !pos -314 0 308 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.SHARABHA, { invaderXim.item.SAND_CAKED_FANG })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.SAND_CAKED_FANG })
end

return entity
