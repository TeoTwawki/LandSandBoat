-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_lacovie (???)
-- Spawns Lacovie
-- !pos -325 23 432 45
-- !pos -336 24 442 45
-- !pos -316 24 442 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.LACOVIE_OFFSET, { invaderXim.ki.CHIPPED_SANDWORM_TOOTH, invaderXim.ki.OVERGROWN_MANDRAGORA_FLOWER })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
