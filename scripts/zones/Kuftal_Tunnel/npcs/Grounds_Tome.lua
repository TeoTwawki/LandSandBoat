-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: Grounds Tome
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.regime.bookOnTrigger(player, invaderXim.regime.type.GROUNDS)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.regime.bookOnEventUpdate(player, option, invaderXim.regime.type.GROUNDS)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.regime.bookOnEventFinish(player, option, invaderXim.regime.type.GROUNDS)
end

return entity
