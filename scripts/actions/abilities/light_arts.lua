-----------------------------------
-- Ability: Light Arts
-- Optimizes white magic capability while lowering black magic proficiency. Grants a bonus to divine, enhancing, enfeebling, and healing magic. Also grants access to Stratagems.
-- Obtained: Scholar Level 10
-- Recast Time: 1:00
-- Duration: 2:00:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if
        player:hasStatusEffect(invaderXim.effect.LIGHT_ARTS) or
        player:hasStatusEffect(invaderXim.effect.ADDENDUM_WHITE)
    then
        return invaderXim.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:delStatusEffectSilent(invaderXim.effect.DARK_ARTS)
    player:delStatusEffect(invaderXim.effect.ADDENDUM_BLACK)
    player:delStatusEffect(invaderXim.effect.PARSIMONY)
    player:delStatusEffect(invaderXim.effect.ALACRITY)
    player:delStatusEffect(invaderXim.effect.MANIFESTATION)
    player:delStatusEffect(invaderXim.effect.EBULLIENCE)
    player:delStatusEffect(invaderXim.effect.FOCALIZATION)
    player:delStatusEffect(invaderXim.effect.EQUANIMITY)
    player:delStatusEffect(invaderXim.effect.IMMANENCE)

    local effectbonus = player:getMod(invaderXim.mod.LIGHT_ARTS_EFFECT)
    local regenbonus  = 0

    if player:getMainJob() == invaderXim.job.SCH and player:getMainLvl() >= 20 then
        regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10)
    end

    player:addStatusEffect(invaderXim.effect.LIGHT_ARTS, effectbonus, 0, 7200, 0, regenbonus)

    return invaderXim.effect.LIGHT_ARTS
end

return abilityObject
