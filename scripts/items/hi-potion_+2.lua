-----------------------------------
-- ID: 4118
-- Item: Hi-Potion +2
-- Item Effect: Restores 120 HP
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
    target:messageBasic(invaderXim.msg.basic.RECOVERS_HP, 0, target:addHP(120 * invaderXim.settings.main.ITEM_POWER))
end

return itemObject
