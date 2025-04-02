-----------------------------------
-- ID: 4125
-- Item: Max-Potion +1
-- Item Effect: Restores 550 HP
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
    target:messageBasic(invaderXim.msg.basic.RECOVERS_HP, 0, target:addHP(550 * invaderXim.settings.main.ITEM_POWER))
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 900)
end

return itemObject
