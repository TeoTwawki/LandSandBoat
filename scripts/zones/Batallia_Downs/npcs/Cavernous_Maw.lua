-----------------------------------
-- Area: Batallia Downs
--  NPC: Cavernous Maw
-- !pos -48 0.1 435 105
-- Teleports Players to Batallia Downs [S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.maws.onTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.maws.onEventFinish(player, csid, option, npc)
end

return entity
