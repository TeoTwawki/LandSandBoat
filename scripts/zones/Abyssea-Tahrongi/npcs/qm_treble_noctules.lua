-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_treble_noctules (???)
-- Spawns Treble Noctules
-- !pos 190 -22 -153 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.TREBLE_NOCTULES, { invaderXim.item.BLOODY_FANG, invaderXim.item.EXORCISED_SKULL })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.BLOODY_FANG, invaderXim.item.EXORCISED_SKULL })
end

return entity
