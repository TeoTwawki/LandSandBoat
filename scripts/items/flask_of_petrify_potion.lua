-----------------------------------
-- ID: 4160
-- Item: Petrify Potion
-- Item Effect: This potion induces petrify.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.PETRIFICATION) then
        target:addStatusEffect(invaderXim.effect.PETRIFICATION, 1, 3, 180)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
