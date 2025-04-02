-----------------------------------
-- Ability: Addendum: White
-- Allows access to additional White Magic spells while using Light Arts.
-- Obtained: Scholar Level 10
-- Recast Time: Stratagem Charge
-- Duration: 2 hours
--
-- Level   |Charges |Recharge Time per Charge
-- -----   -------- ---------------
-- 10      |1       |4:00 minutes
-- 30      |2       |2:00 minutes
-- 50      |3       |1:20 minutes
-- 70      |4       |1:00 minute
-- 90      |5       |48 seconds
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if player:hasStatusEffect(invaderXim.effect.ADDENDUM_WHITE) then
        return invaderXim.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:delStatusEffectSilent(invaderXim.effect.DARK_ARTS)
    player:delStatusEffectSilent(invaderXim.effect.ADDENDUM_BLACK)
    player:delStatusEffectSilent(invaderXim.effect.LIGHT_ARTS)

    local effectbonus = player:getMod(invaderXim.mod.LIGHT_ARTS_EFFECT)
    local regenbonus  = 0

    if player:getMainJob() == invaderXim.job.SCH and player:getMainLvl() >= 20 then
        regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10)
    end

    player:addStatusEffectEx(invaderXim.effect.ADDENDUM_WHITE, invaderXim.effect.ADDENDUM_WHITE, effectbonus, 0, 7200, 0, regenbonus, true)

    return invaderXim.effect.ADDENDUM_WHITE
end

return abilityObject
