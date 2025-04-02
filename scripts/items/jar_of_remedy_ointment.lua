-----------------------------------
-- ID: 5356
-- Item: Remedy Ointment
-- Item Effect: This potion remedies status ailments.
-- Works on paralysis, silence, blindness, poison, and disease.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if
        target:hasStatusEffect(invaderXim.effect.SILENCE) or
        target:hasStatusEffect(invaderXim.effect.BLINDNESS) or
        target:hasStatusEffect(invaderXim.effect.POISON) or
        target:hasStatusEffect(invaderXim.effect.PARALYSIS) or
        target:hasStatusEffect(invaderXim.effect.DISEASE)
    then
        local effectRemoved = 0
        while effectRemoved == 0 do
            local num = math.random(1, 5)
            if num == 1 and target:hasStatusEffect(invaderXim.effect.SILENCE) then
                effectRemoved = effectRemoved + 1
                target:delStatusEffect(invaderXim.effect.SILENCE)

            elseif num == 2 and target:hasStatusEffect(invaderXim.effect.BLINDNESS) then
                effectRemoved = effectRemoved + 1
                target:delStatusEffect(invaderXim.effect.BLINDNESS)

            elseif num == 3 and target:hasStatusEffect(invaderXim.effect.POISON) then
                effectRemoved = effectRemoved + 1
                target:delStatusEffect(invaderXim.effect.POISON)

            elseif num == 4 and target:hasStatusEffect(invaderXim.effect.PARALYSIS) then
                effectRemoved = effectRemoved + 1
                target:delStatusEffect(invaderXim.effect.PARALYSIS)

            elseif num == 5 and target:hasStatusEffect(invaderXim.effect.DISEASE) then
                effectRemoved = effectRemoved + 1
                target:delStatusEffect(invaderXim.effect.DISEASE)
            end
        end
    end
end

return itemObject
