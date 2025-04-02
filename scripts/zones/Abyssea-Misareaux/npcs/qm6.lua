-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm6 (???)
-- Spawns Ironclad Observer
-- !pos -198.742 -32.162 77.431 216
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
