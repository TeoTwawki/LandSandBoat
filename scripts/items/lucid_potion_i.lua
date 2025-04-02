-----------------------------------
-- ID: 5824
-- Item: Lucid Potion I
-- Item Effect: Restores 500 HP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getHP() == target:getMaxHP() then
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:messageBasic(invaderXim.msg.basic.RECOVERS_HP, 0, target:addHP(500 * invaderXim.settings.main.ITEM_POWER))
end

return itemObject
