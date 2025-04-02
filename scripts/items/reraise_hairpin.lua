-----------------------------------
-- ID: 15211
-- Reraise Hairpin
--  This Hairpin functions in the same way as the spell Reraise II.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local duration = 7200
    target:delStatusEffect(invaderXim.effect.RERAISE)
    target:addStatusEffect(invaderXim.effect.RERAISE, 2, 0, duration)
    target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.RERAISE)
end

return itemObject
