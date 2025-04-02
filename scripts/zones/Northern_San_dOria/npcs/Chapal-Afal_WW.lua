-----------------------------------
-- Area: Northern Sand Oria
--  NPC: Chapal-Afal, W.W.
-- !pos -55 -2 31 231
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.WINDURST
local guardType   = invaderXim.conquest.guard.FOREIGN
local guardEvent  = 32759

entity.onTrade = function(player, npc, trade)
    invaderXim.conquest.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

entity.onTrigger = function(player, npc)
    invaderXim.conquest.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.conquest.overseerOnEventUpdate(player, csid, option, guardNation)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.conquest.overseerOnEventFinish(player, csid, option, guardNation, guardType)
end

return entity
