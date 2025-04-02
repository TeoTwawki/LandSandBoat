-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_eccentric_eve (???)
-- Spawns Eccentric Eve
-- !pos 230.413 32.278 280.677 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.ECCENTRIC_EVE_OFFSET, { invaderXim.ki.FRAGRANT_TREANT_PETAL, invaderXim.ki.FETID_RAFFLESIA_STALK, invaderXim.ki.DECAYING_MORBOL_TOOTH, invaderXim.ki.TURBID_SLIME_OIL, invaderXim.ki.VENOMOUS_PEISTE_CLAW })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
