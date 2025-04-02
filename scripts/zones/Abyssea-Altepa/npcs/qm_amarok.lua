-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_amarok (???)
-- Spawns Amarok
-- !pos -558 0 161 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.AMAROK, { invaderXim.item.SHARABHA_HIDE, invaderXim.item.TIGER_KINGS_HIDE, invaderXim.item.HIGH_QUALITY_DHALMEL_HIDE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.SHARABHA_HIDE, invaderXim.item.TIGER_KINGS_HIDE, invaderXim.item.HIGH_QUALITY_DHALMEL_HIDE })
end

return entity
