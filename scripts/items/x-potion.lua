-----------------------------------
-- ID: 4120
-- Item: X-Potion
-- Item Effect: Restores 150 HP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getHP() == target:getMaxHP() then
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    elseif target:hasStatusEffect(invaderXim.effect.MEDICINE) then
        return invaderXim.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:messageBasic(invaderXim.msg.basic.RECOVERS_HP, 0, target:addHP(150 * invaderXim.settings.main.ITEM_POWER))
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 5)
end

return itemObject
