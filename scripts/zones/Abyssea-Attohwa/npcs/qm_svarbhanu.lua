-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_svarbhanu (???)
-- Spawns Svarbhanu
-- !pos -545.043 -12.410 -72.175 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.SVARBHANU, { invaderXim.item.CRACKED_DRAGONSCALE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.CRACKED_DRAGONSCALE })
end

return entity
