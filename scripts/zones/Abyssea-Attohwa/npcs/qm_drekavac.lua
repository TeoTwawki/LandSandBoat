-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_drekavac (???)
-- Spawns Drekavac
-- !pos -158.000 -0.340 220.000 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.DREKAVAC, { invaderXim.item.SET_OF_WAILING_RAGS })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.SET_OF_WAILING_RAGS })
end

return entity
