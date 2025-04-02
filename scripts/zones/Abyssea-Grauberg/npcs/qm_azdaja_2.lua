-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_azdaja_2 (???)
-- Spawns Azdaja
-- !pos -552 -169 138 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.AZDAJA_OFFSET + 4, { invaderXim.ki.VACANT_BUGARD_EYE })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
