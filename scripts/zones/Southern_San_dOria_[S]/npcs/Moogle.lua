-----------------------------------
-- Area: Southern San d'Oria [S]
--  NPC: Moogle
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.moghouse.moogleTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if not player:isInMogHouse() then
        player:startEvent(61)
    else
        invaderXim.moghouse.moogleTrigger(player, npc)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.moghouse.moogleEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.moghouse.moogleEventFinish(player, csid, option, npc)
end

return entity
