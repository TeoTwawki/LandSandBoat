-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_smok_3 (???)
-- Spawns Smok
-- !pos -546.908 -4.640 -12.633 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.SMOK_OFFSET + 8, { invaderXim.ki.HOLLOW_DRAGON_EYE })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
