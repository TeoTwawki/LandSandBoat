-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_lorelei (???)
-- Spawns Lorelei
-- !pos -192 -31 480 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.LORELEI, { invaderXim.item.FAY_TEARDROP })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.FAY_TEARDROP })
end

return entity
