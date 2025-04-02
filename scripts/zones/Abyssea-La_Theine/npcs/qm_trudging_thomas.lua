-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_trudging_thomas (???)
-- Spawns Trudging Thomas
-- !pos 278 24 -82 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.TRUDGING_THOMAS, { invaderXim.item.RAW_MUTTON_CHOP })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.RAW_MUTTON_CHOP })
end

return entity
