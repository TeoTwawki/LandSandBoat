-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_hadhayosh (???)
-- Spawns Hadhayosh
-- !pos 434 24 41 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.HADHAYOSH_OFFSET, { invaderXim.ki.MARBLED_MUTTON_CHOP, invaderXim.ki.BLOODIED_SABER_TOOTH, invaderXim.ki.GLITTERING_PIXIE_CHOKER, invaderXim.ki.BLOOD_SMEARED_GIGAS_HELM })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
