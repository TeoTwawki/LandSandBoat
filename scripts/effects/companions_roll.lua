-----------------------------------
-- invaderXim.effect.COMPANIONS_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local effectregain = { 20, 50, 20, 20, 30, 30, 30, 40, 40, 10, 60, 0 }
    local effectregen = { 4, 20, 6, 8, 10, 12, 14, 16, 18, 3, 25, 0 }
    if effect:getPower() > 69 then
        local rollnum = effect:getPower() - 70
        target:addPetMod(invaderXim.mod.REGAIN, (effectregain[rollnum] + 35))
        target:addPetMod(invaderXim.mod.REGEN, (effectregen[rollnum] + 14))
    end

    if effect:getPower() > 49 and effect:getPower() < 69 then
        local rollnum = effect:getPower() - 50
        target:addPetMod(invaderXim.mod.REGAIN, (effectregain[rollnum] + 25))
        target:addPetMod(invaderXim.mod.REGEN, (effectregen[rollnum] + 10))
    end

    if effect:getPower() > 29 and effect:getPower() < 49 then
        local rollnum = effect:getPower() - 30
        target:addPetMod(invaderXim.mod.REGAIN, (effectregain[rollnum] + 15))
        target:addPetMod(invaderXim.mod.REGEN, (effectregen[rollnum] + 6))
    end

    if effect:getPower() < 19 then
        local rollnum = effect:getPower()
        target:addPetMod(invaderXim.mod.REGAIN, effectregain[rollnum])
        target:addPetMod(invaderXim.mod.REGEN, effectregen[rollnum])
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local effectregain = { 20, 50, 20, 20, 30, 30, 30, 40, 40, 10, 60, 0 }
    local effectregen = { 4, 20, 6, 8, 10, 12, 14, 16, 18, 3, 25, 0 }
    if effect:getPower() > 69 then
        local rollnum = effect:getPower() - 70
        target:delPetMod(invaderXim.mod.REGAIN, (effectregain[rollnum] + 35))
        target:delPetMod(invaderXim.mod.REGEN, (effectregen[rollnum] + 14))
    end

    if effect:getPower() > 49 and effect:getPower() < 69 then
        local rollnum = effect:getPower() - 50
        target:delPetMod(invaderXim.mod.REGAIN, (effectregain[rollnum] + 25))
        target:delPetMod(invaderXim.mod.REGEN, (effectregen[rollnum] + 10))
    end

    if effect:getPower() > 29 and effect:getPower() < 49 then
        local rollnum = effect:getPower() - 30
        target:delPetMod(invaderXim.mod.REGAIN, (effectregain[rollnum] + 15))
        target:delPetMod(invaderXim.mod.REGEN, (effectregen[rollnum] + 6))
    end

    if effect:getPower() < 19 then
        local rollnum = effect:getPower()
        target:delPetMod(invaderXim.mod.REGAIN, effectregain[rollnum])
        target:delPetMod(invaderXim.mod.REGEN, effectregen[rollnum])
    end

    invaderXim.job_utils.corsair.onRollEffectLose(target, effect)
end

return effectObject
