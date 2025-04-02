-----------------------------------
-- Area: Ru'Lude Gardens: Moghouse
--  NPC: Symphonic Curator
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.symphonic_curator.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.symphonic_curator.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.symphonic_curator.onEventFinish(player, csid, option, npc)
end

return entity
