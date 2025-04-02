-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_bloodguzzler (???)
-- Spawns Bloodguzzler
-- !pos -155.000 64.117 590.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.BLOODGUZZLER, { invaderXim.item.VIAL_OF_EFT_BLOOD })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.VIAL_OF_EFT_BLOOD })
end

return entity
