-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_ika_roa (???)
-- Spawns Ika-Roa
-- !pos 158 -29 -215 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.IKA_ROA, { invaderXim.item.HIGH_QUALITY_PUGIL_SCALE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.HIGH_QUALITY_PUGIL_SCALE })
end

return entity
