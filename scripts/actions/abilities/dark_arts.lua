-----------------------------------
-- Ability: Dark Arts
-- Optimizes black magic capability while lowering white magic proficiency. Grants a bonus to enfeebling, elemental, and dark magic. Also grants access to Stratagems.
-- Obtained: Scholar Level 10
-- Recast Time: 1:00
-- Duration: 2:00:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if
        player:hasStatusEffect(invaderXim.effect.DARK_ARTS) or
        player:hasStatusEffect(invaderXim.effect.ADDENDUM_BLACK)
    then
        return invaderXim.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:delStatusEffectSilent(invaderXim.effect.LIGHT_ARTS)
    player:delStatusEffect(invaderXim.effect.ADDENDUM_WHITE)
    player:delStatusEffect(invaderXim.effect.PENURY)
    player:delStatusEffect(invaderXim.effect.CELERITY)
    player:delStatusEffect(invaderXim.effect.ACCESSION)
    player:delStatusEffect(invaderXim.effect.RAPTURE)
    player:delStatusEffect(invaderXim.effect.ALTRUISM)
    player:delStatusEffect(invaderXim.effect.TRANQUILITY)
    player:delStatusEffect(invaderXim.effect.PERPETUANCE)

    local helixbonus = 0

    if player:getMainJob() == invaderXim.job.SCH and player:getMainLvl() >= 20 then
        helixbonus = math.floor(player:getMainLvl() / 4)
    end

    player:addStatusEffect(invaderXim.effect.DARK_ARTS, 1, 0, 7200, 0, helixbonus)

    return invaderXim.effect.DARK_ARTS
end

return abilityObject
