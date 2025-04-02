-----------------------------------
-- Area: Bastok Markets
--  NPC: Umberto
-- Involved in Quest: Too Many Chefs
-- !pos -56.896 -5 -134.267 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getCharVar('TOO_MANY_CHEFS') == 5 then -- end Quest Too Many Chefs
        player:startEvent(473)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 473 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.AILEENS_DELIGHT)
        else
            player:addItem(invaderXim.item.AILEENS_DELIGHT)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.AILEENS_DELIGHT)
            player:addFame(invaderXim.fameArea.BASTOK, 30)
            player:setCharVar('TOO_MANY_CHEFS', 0)
            player:completeQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TOO_MANY_CHEFS)
        end
    end
end

return entity
