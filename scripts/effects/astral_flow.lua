-----------------------------------
-- invaderXim.effect.ASTRAL_FLOW
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:recalculateAbilitiesTable()
    if target:isPC() then
        local jpBonus = target:getJobPointLevel(invaderXim.jp.ASTRAL_FLOW_EFFECT) * 5
        if jpBonus > 0 then
            target:addPetMod(invaderXim.mod.STR, jpBonus)
            target:addPetMod(invaderXim.mod.DEX, jpBonus)
            target:addPetMod(invaderXim.mod.VIT, jpBonus)
            target:addPetMod(invaderXim.mod.AGI, jpBonus)
            target:addPetMod(invaderXim.mod.INT, jpBonus)
            target:addPetMod(invaderXim.mod.MND, jpBonus)
            target:addPetMod(invaderXim.mod.CHR, jpBonus)
        end
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:recalculateAbilitiesTable()
    if target:isPC() then
        local jpBonus = target:getJobPointLevel(invaderXim.jp.ASTRAL_FLOW_EFFECT) * 5
        if jpBonus > 0 then
            target:delPetMod(invaderXim.mod.STR, jpBonus)
            target:delPetMod(invaderXim.mod.DEX, jpBonus)
            target:delPetMod(invaderXim.mod.VIT, jpBonus)
            target:delPetMod(invaderXim.mod.AGI, jpBonus)
            target:delPetMod(invaderXim.mod.INT, jpBonus)
            target:delPetMod(invaderXim.mod.MND, jpBonus)
            target:delPetMod(invaderXim.mod.CHR, jpBonus)
        end
    end
end

return effectObject
