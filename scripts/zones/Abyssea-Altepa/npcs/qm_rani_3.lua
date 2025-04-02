-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_rani_3 (???)
-- Spawns Rani
-- !pos 102 0 -151 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.RANI_OFFSET + 8, { invaderXim.ki.BROKEN_IRON_GIANT_SPIKE, invaderXim.ki.RUSTED_CHARIOT_GEAR })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
