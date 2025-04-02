-----------------------------------
-- invaderXim.effect.LIGHT_ARTS
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:recalculateAbilitiesTable()
    local bonus = effect:getPower()
    local regen = effect:getSubPower()

    target:addMod(invaderXim.mod.WHITE_MAGIC_COST, -bonus)
    target:addMod(invaderXim.mod.WHITE_MAGIC_CAST, -bonus)
    target:addMod(invaderXim.mod.WHITE_MAGIC_RECAST, -bonus)

    if not (target:hasStatusEffect(invaderXim.effect.TABULA_RASA)) then
        target:addMod(invaderXim.mod.WHITE_MAGIC_COST, -10)
        target:addMod(invaderXim.mod.WHITE_MAGIC_CAST, -10)
        target:addMod(invaderXim.mod.WHITE_MAGIC_RECAST, -10)
        target:addMod(invaderXim.mod.BLACK_MAGIC_COST, 20)
        target:addMod(invaderXim.mod.BLACK_MAGIC_CAST, 20)
        target:addMod(invaderXim.mod.BLACK_MAGIC_RECAST, 20)
        target:addMod(invaderXim.mod.LIGHT_ARTS_REGEN, regen)
        target:addMod(invaderXim.mod.REGEN_DURATION, regen * 2)
    end

    target:recalculateSkillsTable()
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:recalculateAbilitiesTable()
    local bonus = effect:getPower()
    local regen = effect:getSubPower()

    target:delMod(invaderXim.mod.WHITE_MAGIC_COST, -bonus)
    target:delMod(invaderXim.mod.WHITE_MAGIC_CAST, -bonus)
    target:delMod(invaderXim.mod.WHITE_MAGIC_RECAST, -bonus)

    if not (target:hasStatusEffect(invaderXim.effect.TABULA_RASA)) then
        target:delMod(invaderXim.mod.WHITE_MAGIC_COST, -10)
        target:delMod(invaderXim.mod.WHITE_MAGIC_CAST, -10)
        target:delMod(invaderXim.mod.WHITE_MAGIC_RECAST, -10)
        target:delMod(invaderXim.mod.BLACK_MAGIC_COST, 20)
        target:delMod(invaderXim.mod.BLACK_MAGIC_CAST, 20)
        target:delMod(invaderXim.mod.BLACK_MAGIC_RECAST, 20)
        target:delMod(invaderXim.mod.LIGHT_ARTS_REGEN, regen)
        target:delMod(invaderXim.mod.REGEN_DURATION, regen * 2)
    end

    target:recalculateSkillsTable()
end

return effectObject
