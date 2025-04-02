-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_kharon (???)
-- Spawns Kharon
-- !pos -403.909 -4.234 200.832 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.KHARON, { invaderXim.item.HANDFUL_OF_BONE_CHIPS })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.HANDFUL_OF_BONE_CHIPS })
end

return entity
