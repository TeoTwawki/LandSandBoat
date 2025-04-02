-----------------------------------
-- ID: 4125
-- Item: Soothing Potion
-- Item Effect: Restores 250 HP
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
    target:messageBasic(invaderXim.msg.basic.RECOVERS_HP, 0, target:addHP(250 * invaderXim.settings.main.ITEM_POWER))
end

return itemObject
