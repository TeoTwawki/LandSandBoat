-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_titlacauan_3 (???)
-- Spawns Titlacauan
-- !pos -396.937 -3.000 259.001 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.TITLACAUAN_OFFSET + 8, { invaderXim.ki.BLOTCHED_DOOMED_TONGUE, invaderXim.ki.CRACKED_SKELETON_CLAVICLE, invaderXim.ki.WRITHING_GHOST_FINGER, invaderXim.ki.RUSTED_HOUND_COLLAR })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
