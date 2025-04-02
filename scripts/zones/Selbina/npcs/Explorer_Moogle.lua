-----------------------------------
-- Area: Selbina
--  NPC: Explorer Moogle
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 1135

entity.onTrigger = function(player, npc)
    invaderXim.teleport.explorerMoogleOnTrigger(player, eventId)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.teleport.explorerMoogleOnEventFinish(player, csid, option, eventId)
end

return entity
