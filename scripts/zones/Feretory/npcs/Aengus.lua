-----------------------------------
-- Area: Feretory
--  NPC: Aengus
-- !pos TODO
-----------------------------------
require('scripts/globals/monstrosity')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.monstrosity.aengusOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.monstrosity.aengusOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.monstrosity.aengusOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.monstrosity.aengusOnEventFinish(player, csid, option, npc)
end

return entity
