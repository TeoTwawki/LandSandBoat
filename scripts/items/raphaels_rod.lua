-----------------------------------
-- ID: 18398
-- Raphael's Rod
-- Grants Reraise III.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:delStatusEffect(invaderXim.effect.RERAISE)
    target:addStatusEffect(invaderXim.effect.RERAISE, 3, 0, 7200)
    target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.RERAISE)
end

return itemObject
