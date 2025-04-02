-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm7 (???)
-- Spawns Nehebkau
-- !pos 321 23 -355 216
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
