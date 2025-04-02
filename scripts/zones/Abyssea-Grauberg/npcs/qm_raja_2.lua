-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_raja_2 (???)
-- Spawns Raja
-- !pos 495 56 679 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.RAJA_OFFSET + 4, { invaderXim.ki.WARPED_CHARIOT_PLATE, invaderXim.ki.SHATTERED_IRON_GIANT_CHAIN })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
