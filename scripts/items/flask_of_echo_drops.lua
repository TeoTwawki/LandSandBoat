-----------------------------------
-- ID: 4151
-- Item: Echo Drops
-- Item Effect: This potion remedies silence.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(invaderXim.effect.SILENCE) then
        target:delStatusEffect(invaderXim.effect.SILENCE)
    end
end

return itemObject
