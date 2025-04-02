-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_kukulkan (???)
-- Spawns Kukulkan
-- !pos -40.000 71.992 560.000 15
-- !pos -40.000 68.692 575.000 15
-- !pos -25.000 68.792 560.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.KUKULKAN_OFFSET, { invaderXim.ki.TATTERED_HIPPOGRYPH_WING, invaderXim.ki.CRACKED_WIVRE_HORN, invaderXim.ki.MUCID_AHRIMAN_EYEBALL })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
