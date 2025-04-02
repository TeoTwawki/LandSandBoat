-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_chloris (???)
-- Spawns Chloris
-- !pos 160 0 -15 45
-- !pos 160 0 0 45
-- !pos 160 0 -30 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.CHLORIS_OFFSET, { invaderXim.ki.TORN_BAT_WING, invaderXim.ki.VEINOUS_HECTEYES_EYELID, invaderXim.ki.MOSSY_ADAMANTOISE_SHELL, invaderXim.ki.GORY_SCORPION_CLAW })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
