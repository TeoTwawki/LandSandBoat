-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_xibalba (???)
-- Spawns Xibalba
-- !pos -487 -168 211 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.XIBALBA, { invaderXim.item.DECAYING_MOLAR })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.DECAYING_MOLAR })
end

return entity
