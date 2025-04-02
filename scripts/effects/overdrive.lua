-----------------------------------
-- invaderXim.effect.OVERDRIVE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.OVERLOAD_THRESH, 5000)
    local pet = target:getPet()
    local jpBonus = target:getJobPointLevel(invaderXim.jp.OVERDRIVE_EFFECT) * 5

    if pet then
        pet:setLocalVar('overdrive', 1)
        pet:addMod(invaderXim.mod.HASTE_MAGIC, 2500)
        pet:addMod(invaderXim.mod.MAIN_DMG_RATING, 30)
        pet:addMod(invaderXim.mod.RANGED_DMG_RATING, 30)
        pet:addMod(invaderXim.mod.ATTP, 50)
        pet:addMod(invaderXim.mod.RATTP, 50)
        pet:addMod(invaderXim.mod.ACC, 100)
        pet:addMod(invaderXim.mod.RACC, 100)
        pet:addMod(invaderXim.mod.EVA, 50)
        pet:addMod(invaderXim.mod.MEVA, 50)
        pet:addMod(invaderXim.mod.REVA, 50)
        pet:addMod(invaderXim.mod.DMG, -5000)
        if jpBonus > 0 then
            pet:addMod(invaderXim.mod.STR, jpBonus)
            pet:addMod(invaderXim.mod.DEX, jpBonus)
            pet:addMod(invaderXim.mod.VIT, jpBonus)
            pet:addMod(invaderXim.mod.AGI, jpBonus)
            pet:addMod(invaderXim.mod.INT, jpBonus)
            pet:addMod(invaderXim.mod.MND, jpBonus)
            pet:addMod(invaderXim.mod.CHR, jpBonus)
        end
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.OVERLOAD_THRESH, 5000)
    local pet = target:getPet()
    local jpBonus = target:getJobPointLevel(invaderXim.jp.OVERDRIVE_EFFECT) * 5

    if pet and pet:getLocalVar('overdrive') ~= 0 then
        pet:setLocalVar('overdrive', 0)
        pet:delMod(invaderXim.mod.HASTE_MAGIC, 2500)
        pet:delMod(invaderXim.mod.MAIN_DMG_RATING, 30)
        pet:delMod(invaderXim.mod.RANGED_DMG_RATING, 30)
        pet:delMod(invaderXim.mod.ATTP, 50)
        pet:delMod(invaderXim.mod.RATTP, 50)
        pet:delMod(invaderXim.mod.ACC, 100)
        pet:delMod(invaderXim.mod.RACC, 100)
        pet:delMod(invaderXim.mod.EVA, 50)
        pet:delMod(invaderXim.mod.MEVA, 50)
        pet:delMod(invaderXim.mod.REVA, 50)
        pet:delMod(invaderXim.mod.DMG, -5000)
        if jpBonus > 0 then
            pet:delMod(invaderXim.mod.STR, jpBonus)
            pet:delMod(invaderXim.mod.DEX, jpBonus)
            pet:delMod(invaderXim.mod.VIT, jpBonus)
            pet:delMod(invaderXim.mod.AGI, jpBonus)
            pet:delMod(invaderXim.mod.INT, jpBonus)
            pet:delMod(invaderXim.mod.MND, jpBonus)
            pet:delMod(invaderXim.mod.CHR, jpBonus)
        end
    end
end

return effectObject
