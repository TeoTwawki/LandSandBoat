-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_muscaliet (???)
-- Spawns Muscaliet
-- !pos 253 46 291 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.MUSCALIET, { invaderXim.item.RESILIENT_MANE, invaderXim.item.SMOOTH_WHISKER })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.RESILIENT_MANE, invaderXim.item.SMOOTH_WHISKER })
end

return entity
