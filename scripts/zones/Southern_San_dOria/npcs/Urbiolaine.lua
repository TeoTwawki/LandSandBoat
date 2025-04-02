-----------------------------------
-- Area: Southern San d'Oria
-- NPC : Urbiolaine
-- Unity NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.unity.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.unity.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.unity.onEventFinish(player, csid, option, npc)
end

return entity
