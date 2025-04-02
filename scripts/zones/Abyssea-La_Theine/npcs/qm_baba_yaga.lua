-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_baba_yaga (???)
-- Spawns Baba Yaga
-- !pos -74 18 137 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.BABA_YAGA, { invaderXim.item.PICEOUS_SCALE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.PICEOUS_SCALE })
end

return entity
