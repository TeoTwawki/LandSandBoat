-----------------------------------
-- Area: Feretory
--  NPC: Teyrnon
-- !pos TODO
-----------------------------------
require('scripts/globals/monstrosity')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.monstrosity.teyrnonOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.monstrosity.teyrnonOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.monstrosity.teyrnonOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.monstrosity.teyrnonOnEventFinish(player, csid, option, npc)
end

return entity
