-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_sarcophilus (???)
-- Spawns Sarcophilus
-- !pos -235.000 -15.882 -120.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.SARCOPHILUS, { invaderXim.item.RIPPED_EFT_SKIN })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.RIPPED_EFT_SKIN })
end

return entity
