-----------------------------------
-- ID: 4172
-- Item: Reraiser
-- Item Effect: This potion functions inthe same way as the spell Reraise.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local duration = 3600
    target:delStatusEffect(invaderXim.effect.RERAISE)
    target:addStatusEffect(invaderXim.effect.RERAISE, 1, 0, duration)
    target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.RERAISE)
end

return itemObject
