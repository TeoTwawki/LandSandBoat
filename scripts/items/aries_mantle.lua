-----------------------------------
-- ID: 13693
-- Item: Aries Mantle
-- Enchantment: Sleep
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if
        target:hasStatusEffect(invaderXim.effect.SLEEP_I) or
        target:hasStatusEffect(invaderXim.effect.SLEEP_II) or
        target:hasStatusEffect(invaderXim.effect.LULLABY)
    then
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(invaderXim.effect.SLEEP_I, 0, 0, 30)
    end
end

return itemObject
