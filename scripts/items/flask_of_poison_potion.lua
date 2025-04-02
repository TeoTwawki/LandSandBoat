-----------------------------------
-- ID: 4157
-- Item: Poison Potion
-- Item Effect: Poison 1HP / Removes 60 HP over 180 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.POISON) then
        target:addStatusEffect(invaderXim.effect.POISON, 1, 3, 180)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
