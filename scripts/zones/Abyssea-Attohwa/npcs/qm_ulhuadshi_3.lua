-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_ulhuadshi_3 (???)
-- Spawns Ulhuadshi
-- !pos 340.193 20.005 220.340 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.ULHUADSHI_OFFSET + 8, { invaderXim.ki.MUCID_WORM_SEGMENT, invaderXim.ki.SHRIVELED_HECTEYES_STALK })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
