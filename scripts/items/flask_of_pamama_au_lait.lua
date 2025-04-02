-----------------------------------
-- ID: 4302
-- Item: Pamama au Lait
-- Item Effect: Restores 400 HP over 600 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.REGEN) then
        target:addStatusEffect(invaderXim.effect.REGEN, 2, 3, 600)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
