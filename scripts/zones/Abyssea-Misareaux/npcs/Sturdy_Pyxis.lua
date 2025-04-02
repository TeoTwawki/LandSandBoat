-----------------------------------
-- Area: Abyssea
-- NPC: Sturdy Pyxis
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.pyxis.npc.onPyxisTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.pyxis.npc.onPyxisTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.pyxis.npc.onPyxisEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.pyxis.npc.onPyxisEventFinish(player, csid, option, npc)
end

return entity
