-----------------------------------
-- Area: Port Windurst
--  NPC: Sachetan, I.M.
-- !pos -82 -5 165 z 240
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.BASTOK
local guardType   = invaderXim.conquest.guard.FOREIGN
local guardEvent  = 32761

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
