-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm12 (???)
-- Spawns Npfundlwa
-- !pos 412 -7 50 216
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
