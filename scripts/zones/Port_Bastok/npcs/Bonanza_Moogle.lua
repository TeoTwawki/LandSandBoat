-----------------------------------
-- Area: Port Bastok
--  NPC: Bonanza Moogle
-- !pos TODO
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.mogBonanza.onBonanzaMoogleTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.events.mogBonanza.onBonanzaMoogleTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.events.mogBonanza.onBonanzaMoogleEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.events.mogBonanza.onBonanzaMoogleEventFinish(player, csid, option, npc)
end

return entity
