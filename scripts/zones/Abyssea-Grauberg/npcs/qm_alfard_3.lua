-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_alfard_3 (???)
-- Spawns Alfard
-- !pos 309 -39 189 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.ALFARD_OFFSET + 8, { invaderXim.ki.VENOMOUS_HYDRA_FANG })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
