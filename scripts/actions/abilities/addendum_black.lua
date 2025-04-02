-----------------------------------
-- Ability: Addendum: Black
-- Allows access to additional Black Magic spells while using Dark Arts.
-- Obtained: Scholar Level 30
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
    if player:hasStatusEffect(invaderXim.effect.ADDENDUM_BLACK) then
        return invaderXim.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:delStatusEffectSilent(invaderXim.effect.LIGHT_ARTS)
    player:delStatusEffectSilent(invaderXim.effect.ADDENDUM_WHITE)
    player:delStatusEffectSilent(invaderXim.effect.DARK_ARTS)

    local effectbonus = player:getMod(invaderXim.mod.DARK_ARTS_EFFECT)
    local helixbonus  = 0

    if player:getMainJob() == invaderXim.job.SCH and player:getMainLvl() >= 20 then
        helixbonus = math.floor(player:getMainLvl() / 4)
    end

    player:addStatusEffectEx(invaderXim.effect.ADDENDUM_BLACK, invaderXim.effect.ADDENDUM_BLACK, effectbonus, 0, 7200, 0, helixbonus, true)

    return invaderXim.effect.ADDENDUM_BLACK
end

return abilityObject
