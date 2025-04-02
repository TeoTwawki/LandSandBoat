-----------------------------------
-- Area: Windurst Waters
--  NPC: Jack of Hearts
-- Adventurer's Assistant
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:getItemCount() == 1 and
        trade:hasItemQty(invaderXim.item.ADVENTURER_COUPON, 1)
    then
        player:startEvent(10012, invaderXim.settings.main.GIL_RATE * 50)
        player:addGil(invaderXim.settings.main.GIL_RATE * 50)
        player:tradeComplete()
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(10011, 0, 1)
end

return entity
