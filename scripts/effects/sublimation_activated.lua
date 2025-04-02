-----------------------------------
-- invaderXim.effect.SUBLIMATION_ACTIVATED
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
end

effectObject.onEffectTick = function(target, effect)
    local complete = false
    local level = 0
    if target:getMainJob() == invaderXim.job.SCH then
        level = target:getMainLvl()
    else
        level = target:getSubLvl()
    end

    local basemp = math.floor((level - 15) / 10)
    local bonus = target:getMod(invaderXim.mod.SUBLIMATION_BONUS)

    local dmg = 2 + bonus

    local store = effect:getPower() + basemp + bonus

    -- The effect changes to "Sublimation: Complete" when the total MP stored is equal to 50% of your maximum HP or when the player's HP falls to orange level (<50%).
    local limit = math.floor((target:getBaseHP() + target:getMod(invaderXim.mod.HP) + target:getMerit(invaderXim.merit.MAX_HP)) / 2) +
        target:getMerit(invaderXim.merit.MAX_SUBLIMATION) * 10 + target:getJobPointLevel(invaderXim.jp.SUBLIMATION_EFFECT) * 3

    if target:getHPP() >= 51 then
        if target:hasStatusEffect(invaderXim.effect.STONESKIN) then
            local skin = target:getMod(invaderXim.mod.STONESKIN)
            if skin >= dmg then --absorb all damage
                target:delMod(invaderXim.mod.STONESKIN, dmg)
            else
                target:delStatusEffect(invaderXim.effect.STONESKIN)
                target:takeDamage(dmg - skin)
                if target:getHPP() < 51 then
                    complete = true
                end
            end
        else
            target:takeDamage(dmg)
            if target:getHPP() < 51 then
                complete = true
            end
        end
    else
        complete = true
    end

    if store > limit then
        store = limit
        complete = true
    end

    if complete then
        target:delStatusEffectSilent(invaderXim.effect.SUBLIMATION_ACTIVATED)
        target:addStatusEffect(invaderXim.effect.SUBLIMATION_COMPLETE, store, 0, 7200)
    else
        effect:setPower(store)
    end
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
