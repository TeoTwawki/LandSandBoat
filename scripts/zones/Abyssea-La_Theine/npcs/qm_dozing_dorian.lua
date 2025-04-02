-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_dozing_dorian (???)
-- Spawns Dozing Dorian
-- !pos 703 40 283 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.DOZING_DORIAN, { invaderXim.item.DRIED_CHIGOE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.DRIED_CHIGOE })
end

return entity
