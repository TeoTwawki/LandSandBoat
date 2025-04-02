-----------------------------------
-- ID: 5327
-- Item: Potion Drop
-- Item Effect: Restores 60 HP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(invaderXim.effect.MEDICINE) then
        return invaderXim.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addHP(60 * invaderXim.settings.main.ITEM_POWER)
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 300)
end

return itemObject
