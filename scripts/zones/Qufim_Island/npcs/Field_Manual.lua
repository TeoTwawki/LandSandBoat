-----------------------------------
-- Area: Qufim Island
-- Field Manual
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.regime.bookOnTrigger(player, invaderXim.regime.type.FIELDS)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.regime.bookOnEventUpdate(player, option, invaderXim.regime.type.FIELDS)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.regime.bookOnEventFinish(player, option, invaderXim.regime.type.FIELDS)
end

return entity
