-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm10 (???)
-- Spawns Nonno
-- !pos 719 1 -486 216
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- invaderXim.abyssea.qmOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- invaderXim.abyssea.qmOnTrigger(player, npc)
end

return entity
