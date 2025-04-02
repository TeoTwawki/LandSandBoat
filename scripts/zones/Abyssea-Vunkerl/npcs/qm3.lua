-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm3 (???)
-- Spawns Iku-Turso
-- !pos 244 -32 240 217
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
