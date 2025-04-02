-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_glavoid (???)
-- Spawns Glavoid
-- !pos 196 32 400 45
-- !pos 196 34 415 45
-- !pos 211 33 400 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.GLAVOID_OFFSET, { invaderXim.ki.LUXURIANT_MANTICORE_MANE, invaderXim.ki.FAT_LINED_COCKATRICE_SKIN, invaderXim.ki.STICKY_GNAT_WING, invaderXim.ki.SODDEN_SANDWORM_HUSK })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
