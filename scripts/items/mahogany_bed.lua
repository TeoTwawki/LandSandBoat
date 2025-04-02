-----------------------------------
-- ID: 4
-- Item: Mahogany Bed
-----------------------------------
---@type TItemFurniture
local itemObject = {}

itemObject.onFurniturePlaced = function(player)
    if player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_MOOGLE_PICNIC) == invaderXim.questStatus.QUEST_AVAILABLE then
        player:setCharVar('Quest[4][101]bedPlacedTime', os.time())
        player:setLocalVar('Quest[4][101]mustZone', 1)
    end
end

itemObject.onFurnitureRemoved = function(player)
    player:setCharVar('Quest[4][101]bedPlacedTime', 0)
end

return itemObject
