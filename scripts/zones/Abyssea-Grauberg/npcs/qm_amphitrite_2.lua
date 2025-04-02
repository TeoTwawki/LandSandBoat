-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_amphitrite_2 (???)
-- Spawns Amphitrite
-- !pos -136 -31 -231 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.AMPHITRITE_OFFSET + 4, { invaderXim.ki.VARIEGATED_URAGNITE_SHELL })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
