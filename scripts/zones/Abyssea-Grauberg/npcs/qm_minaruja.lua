-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_minaruja (???)
-- Spawns Minaruja
-- !pos 340 -15 -116 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.MINARUJA, { invaderXim.item.PURSUERS_WING })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.PURSUERS_WING })
end

return entity
