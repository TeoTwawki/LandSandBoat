-----------------------------------
-- ID: 4148
-- Item: Tincture
-- Item Effect: This potion remedies disease and plague
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(invaderXim.effect.PLAGUE) then
        target:delStatusEffect(invaderXim.effect.PLAGUE)
    end

    if target:hasStatusEffect(invaderXim.effect.DISEASE) then
        target:delStatusEffect(invaderXim.effect.DISEASE)
    end
end

return itemObject
