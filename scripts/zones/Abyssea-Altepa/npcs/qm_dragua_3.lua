-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_dragua_3 (???)
-- Spawns Dragua
-- !pos -400 0.150 127 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.DRAGUA_OFFSET + 8, { invaderXim.ki.BLOODIED_DRAGON_EAR })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
