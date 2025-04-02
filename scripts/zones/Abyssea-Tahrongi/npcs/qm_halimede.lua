-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_halimede (???)
-- Spawns Halimede
-- !pos -234 15 -603 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.HALIMEDE, { invaderXim.item.HIGH_QUALITY_CLIONID_WING })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.HIGH_QUALITY_CLIONID_WING })
end

return entity
