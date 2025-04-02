-----------------------------------
-- Area: Port San d'Oria
--  NPC: Festive Moogle
-- Type: Event NPC
--  !pos 70.641 -16.000 -118.589 232
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
