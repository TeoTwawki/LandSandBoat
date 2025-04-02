-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_briareus (???)
-- Spawns Briareus
-- !pos -179 7 259 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.BRIAREUS_OFFSET, { invaderXim.ki.DENTED_GIGAS_SHIELD, invaderXim.ki.WARPED_GIGAS_ARMBAND, invaderXim.ki.SEVERED_GIGAS_COLLAR })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
