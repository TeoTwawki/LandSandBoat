-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_siranpa-kamuy (???)
-- Spawns Siranpa-Kamuy
-- !pos 370.000 1.601 10.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.SIRANPA_KAMUY, { invaderXim.item.ROTTING_EYEBALL })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.ROTTING_EYEBALL })
end

return entity
