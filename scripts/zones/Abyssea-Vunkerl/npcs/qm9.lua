-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm9 (???)
-- Spawns Chhir Batti
-- !pos -395.665 -31.565 358.085 217
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
