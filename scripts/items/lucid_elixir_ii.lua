-----------------------------------
-- ID: 5831
-- Item: Lucid Elixir II
-- Item Effect: Restores 75% of HP and MP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if
        target:getMaxHP() == target:getHP() and
        target:getMaxMP() == target:getMP()
    then
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE_2
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addHP(target:getMaxHP() * 0.75 * invaderXim.settings.main.ITEM_POWER)
    target:addMP(target:getMaxMP() * 0.75 * invaderXim.settings.main.ITEM_POWER)
    target:messageBasic(invaderXim.msg.basic.RECOVERS_HP_AND_MP)
end

return itemObject
