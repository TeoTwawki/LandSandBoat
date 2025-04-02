-----------------------------------
-- ID: 15182
-- Item: Zoolater Hat
-- Item Effect: Pet gets meditate
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local pet = target:getPet()
    if pet then
        pet:addStatusEffect(invaderXim.effect.REGAIN, 15, 3, 15)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
