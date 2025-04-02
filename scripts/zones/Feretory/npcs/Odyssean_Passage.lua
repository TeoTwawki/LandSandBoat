-----------------------------------
-- Area: Feretory
--  NPC: Odyssean Passage
-- !pos TODO
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.monstrosity.odysseanPassageOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.monstrosity.odysseanPassageOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.monstrosity.odysseanPassageOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.monstrosity.odysseanPassageOnEventFinish(player, csid, option, npc)
end

return entity
