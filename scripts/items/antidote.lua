-----------------------------------
-- ID: 4148
-- Item: Antidote
-- Item Effect: This potion remedies poison.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(invaderXim.effect.POISON) then
        target:delStatusEffect(invaderXim.effect.POISON)
    end
end

return itemObject
