-----------------------------------
-- ID: 4300
-- Item: Apple au Lait
-- Item Effect: Restores 120 HP over 180 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.REGEN) then
        target:addStatusEffect(invaderXim.effect.REGEN, 2, 3, 180)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
