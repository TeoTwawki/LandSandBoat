-----------------------------------
-- ID: 4155
-- Item: Remedy
-- Item Effect: This potion remedies status ailments.
-- Works on paralysis, silence, blindness, poison, and disease.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

local removableStatus =
{
    invaderXim.effect.SILENCE,
    invaderXim.effect.BLINDNESS,
    invaderXim.effect.POISON,
    invaderXim.effect.PARALYSIS,
}

itemObject.onItemUse = function(target)
    for _, effectId in ipairs(removableStatus) do
        if target:hasStatusEffect(effectId) then
            target:delStatusEffect(effectId)
        end
    end

    local rDisease = math.random(1, 2) -- Disease is not guaranteed to be cured, 1 means removed 2 means fail. 50% chance
    if rDisease == 1 and target:hasStatusEffect(invaderXim.effect.DISEASE) then
        target:delStatusEffect(invaderXim.effect.DISEASE)
    end
end

return itemObject
