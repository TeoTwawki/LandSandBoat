-----------------------------------
-- ID: 15170
-- Item: Blink Band
-- Item Effect: 3 shadows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if
        target:hasStatusEffect(invaderXim.effect.COPY_IMAGE) or
        target:hasStatusEffect(invaderXim.effect.THIRD_EYE)
    then
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(invaderXim.effect.BLINK, 3, 0, 300)
        target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.BLINK)
    end
end

return itemObject
