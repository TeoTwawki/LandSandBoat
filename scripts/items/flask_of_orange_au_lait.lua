-----------------------------------
-- ID: 4299
-- Item: Orange au Lait
-- Item Effect: Restores 100 HP over 300 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.REGEN) then
        target:addStatusEffect(invaderXim.effect.REGEN, 1, 3, 300)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
