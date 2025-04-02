-----------------------------------
-- Area: Windurst Walls
--  NPC: Festive Moogle
-- Type: Event NPC
--  !pos -206.927 -0.521 -144.713 239
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.festiveMoogle.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.festiveMoogle.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.festiveMoogle.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.festiveMoogle.onEventFinish(player, csid, option, npc)
end

return entity
