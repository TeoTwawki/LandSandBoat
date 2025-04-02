-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm24 (???)
-- Spawns Karkadann
-- !pos -157 -31 88 217
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- invaderXim.abyssea.qmOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- invaderXim.abyssea.qmOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
