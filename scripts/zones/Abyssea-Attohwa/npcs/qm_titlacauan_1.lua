-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_titlacauan_1 (???)
-- Spawns Titlacauan
-- !pos -404.436 -4.000 246.000 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.TITLACAUAN_OFFSET, { invaderXim.ki.BLOTCHED_DOOMED_TONGUE, invaderXim.ki.CRACKED_SKELETON_CLAVICLE, invaderXim.ki.WRITHING_GHOST_FINGER, invaderXim.ki.RUSTED_HOUND_COLLAR })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
