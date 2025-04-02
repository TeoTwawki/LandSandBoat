-----------------------------------
-- ID: 5320
-- Item: Chunk of Smelling Salts
-- Item Effect: Recover Pets from Sleep
-- Duration: 180 Secs Medicated
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local pet = target:getPet()

    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET
    elseif pet:hasStatusEffect(invaderXim.effect.MEDICINE) then
        return invaderXim.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 180, 5320) then
        local pet = target:getPet()
        if not pet then
            return
        end

        -- TODO: Verify targeting and messages are correct
        target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.MEDICINE)
        pet:delStatusEffect(invaderXim.effect.SLEEP_I)
        pet:delStatusEffect(invaderXim.effect.SLEEP_II)
        pet:delStatusEffect(invaderXim.effect.LULLABY)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

itemObject.onEffectGain = function(target, effect)
end

itemObject.onEffectLose = function(target, effect)
end

return itemObject
