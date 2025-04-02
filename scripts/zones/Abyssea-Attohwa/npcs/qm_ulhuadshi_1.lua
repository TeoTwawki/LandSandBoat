-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_ulhuadshi_1 (???)
-- Spawns Ulhuadshi
-- !pos 350.692 19.455 209.839 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.ULHUADSHI_OFFSET, { invaderXim.ki.MUCID_WORM_SEGMENT, invaderXim.ki.SHRIVELED_HECTEYES_STALK })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
