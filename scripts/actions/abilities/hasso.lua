-----------------------------------
-- Ability: Hasso
-- Grants a bonus to attack speed, accuracy, and Strength when using two-handed weapons, but increases recast and casting times.
-- Obtained: Samurai Level 25
-- Recast Time: 1:00
-- Duration: 5:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if not target:isWeaponTwoHanded() then
        return invaderXim.msg.basic.NEEDS_2H_WEAPON, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    local strboost = 0

    if target:getMainJob() == invaderXim.job.SAM then
        strboost = (target:getMainLvl() / 7) + target:getJobPointLevel(invaderXim.jp.HASSO_EFFECT)
    elseif target:getSubJob() == invaderXim.job.SAM then
        strboost = target:getSubLvl() / 7
    end

    if strboost > 0 then
        target:delStatusEffect(invaderXim.effect.HASSO)
        target:delStatusEffect(invaderXim.effect.SEIGAN)
        target:addStatusEffect(invaderXim.effect.HASSO, strboost, 0, 300)
    end
end

return abilityObject
