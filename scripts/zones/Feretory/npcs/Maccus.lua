-----------------------------------
-- Area: Feretory
--  NPC: Maccus
-- !pos TODO
-----------------------------------
require('scripts/globals/monstrosity')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.monstrosity.maccusOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.monstrosity.maccusOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.monstrosity.maccusOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.monstrosity.maccusOnEventFinish(player, csid, option, npc)
end

return entity
