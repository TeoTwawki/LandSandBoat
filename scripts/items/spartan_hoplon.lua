-----------------------------------
-- ID: 15170
-- Item: Spartan Hoplon
-- Item Effect: Phalanx
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:addStatusEffect(invaderXim.effect.PHALANX, 10, 0, 180) then -- Retail potency unknown, 10 is a guess. (someone 1000 needles test this thing!)
        target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.PHALANX)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
