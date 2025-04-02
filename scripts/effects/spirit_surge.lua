-----------------------------------
-- invaderXim.effect.SPIRIT_SURGE
-----------------------------------
---@type TEffect
local effectObject = {}

-- https://www.bg-wiki.com/ffxi/Spirit_Surge

effectObject.onEffectGain = function(target, effect)
    -- The dragoon's MAX HP increases by % of wyvern MaxHP
    target:addMod(invaderXim.mod.HP, effect:getPower())
    target:updateHealth()

    -- The dragoon gets a Strength boost relative to his level
    target:addMod(invaderXim.mod.STR, effect:getSubPower())

    -- The dragoon gets a 50 Accuracy boost
    target:addMod(invaderXim.mod.ACC, 50)

    -- Wyvern levelup bonuses appear to be transferred as if the wyvern was max level:
    -- Does this also give the 10% all hits WSD and the 15% DA with job point gifts?
    target:addMod(invaderXim.mod.ATTP, 25)
    target:addMod(invaderXim.mod.DEFP, 25)

    -- The dragoon gets 25% Haste (see http://wiki.bluegartr.com/bg/Job_Ability_Haste for haste calculation)
    target:addMod(invaderXim.mod.HASTE_ABILITY, 2500)

    -- DMG + 1 * JP
    target:addMod(invaderXim.mod.MAIN_DMG_RATING, target:getJobPointLevel(invaderXim.jp.SPIRIT_SURGE_EFFECT))
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    -- The dragoon's MAX HP returns to normal
    target:delMod(invaderXim.mod.HP, effect:getPower())

    -- The dragoon loses the Strength boost
    target:delMod(invaderXim.mod.STR, effect:getSubPower())

    -- The dragoon loses the 50 Accuracy boost
    target:delMod(invaderXim.mod.ACC, 50)

    -- The dragoon loses 25% Haste
    target:delMod(invaderXim.mod.HASTE_ABILITY, 2500)

    -- Remove wyvern levelup bonuses
    target:delMod(invaderXim.mod.ATTP, 25)
    target:delMod(invaderXim.mod.DEFP, 25)

    target:delMod(invaderXim.mod.MAIN_DMG_RATING, target:getJobPointLevel(invaderXim.jp.SPIRIT_SURGE_EFFECT))
end

return effectObject
