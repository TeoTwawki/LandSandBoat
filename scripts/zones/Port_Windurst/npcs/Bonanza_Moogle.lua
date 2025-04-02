-----------------------------------
-- Area: Port Windurst
--  NPC: Bonanza Moogle
-- !pos -67.140 -4.055 143.542 240
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
