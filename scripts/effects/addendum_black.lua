-----------------------------------
-- invaderXim.effect.ADDENDUM_BLACK
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if target:getObjType() ~= invaderXim.objType.TRUST then -- account for trusts
        target:recalculateAbilitiesTable()
    end

    local bonus = effect:getPower()
    local helix = effect:getSubPower()

    target:addMod(invaderXim.mod.BLACK_MAGIC_COST, -bonus)
    target:addMod(invaderXim.mod.BLACK_MAGIC_CAST, -bonus)
    target:addMod(invaderXim.mod.BLACK_MAGIC_RECAST, -bonus)

    if not (target:hasStatusEffect(invaderXim.effect.TABULA_RASA)) then
        target:addMod(invaderXim.mod.BLACK_MAGIC_COST, -10)
        target:addMod(invaderXim.mod.BLACK_MAGIC_CAST, -10)
        target:addMod(invaderXim.mod.BLACK_MAGIC_RECAST, -10)
        target:addMod(invaderXim.mod.WHITE_MAGIC_COST, 20)
        target:addMod(invaderXim.mod.WHITE_MAGIC_CAST, 20)
        target:addMod(invaderXim.mod.WHITE_MAGIC_RECAST, 20)
        target:addMod(invaderXim.mod.HELIX_EFFECT, helix)
        target:addMod(invaderXim.mod.HELIX_DURATION, 72)
    end

    if target:getObjType() ~= invaderXim.objType.TRUST then
        target:recalculateSkillsTable()
    else -- account for trusts
        local rankD = target:getSkillLevel(invaderXim.skill.ENFEEBLING_MAGIC)
        local artsRank = target:getMaxSkillLevel(target:getMainLvl(), invaderXim.job.RDM, invaderXim.skill.ENHANCING_MAGIC)
        local trustArts = artsRank - rankD

        -- TODO: update charutils to work with Trusts
        target:addMod(invaderXim.mod.MACC, trustArts)
        -- cheats in MACC since Skill MODs aren't processed outside of charutils
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    if target:getObjType() ~= invaderXim.objType.TRUST then -- account for trusts
        target:recalculateAbilitiesTable()
    end

    local bonus = effect:getPower()
    local helix = effect:getSubPower()

    target:delMod(invaderXim.mod.BLACK_MAGIC_COST, -bonus)
    target:delMod(invaderXim.mod.BLACK_MAGIC_CAST, -bonus)
    target:delMod(invaderXim.mod.BLACK_MAGIC_RECAST, -bonus)

    if not (target:hasStatusEffect(invaderXim.effect.TABULA_RASA)) then
        target:delMod(invaderXim.mod.BLACK_MAGIC_COST, -10)
        target:delMod(invaderXim.mod.BLACK_MAGIC_CAST, -10)
        target:delMod(invaderXim.mod.BLACK_MAGIC_RECAST, -10)
        target:delMod(invaderXim.mod.WHITE_MAGIC_COST, 20)
        target:delMod(invaderXim.mod.WHITE_MAGIC_CAST, 20)
        target:delMod(invaderXim.mod.WHITE_MAGIC_RECAST, 20)
        target:delMod(invaderXim.mod.HELIX_EFFECT, helix)
        target:delMod(invaderXim.mod.HELIX_DURATION, 72)
    end

    if target:getObjType() ~= invaderXim.objType.TRUST then
        target:recalculateSkillsTable()
    else -- account for trusts
        local rankD = target:getSkillLevel(invaderXim.skill.ENFEEBLING_MAGIC)
        local artsRank = target:getMaxSkillLevel(target:getMainLvl(), invaderXim.job.RDM, invaderXim.skill.ENHANCING_MAGIC)
        local trustArts = artsRank - rankD

        -- TODO: update charutils to work with Trusts
        target:delMod(invaderXim.mod.MACC, trustArts)
        -- cheats out MACC since Skill MODs aren't processed outside of charutils
    end
end

return effectObject
