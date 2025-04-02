-----------------------------------
-- Somnolence
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    -- Damage
    local damage = 10 + pet:getMainLvl() * 2

    damage = invaderXim.mobskills.mobMagicalMove(pet, target, petskill, damage, invaderXim.element.FIRE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = invaderXim.mobskills.mobAddBonuses(pet, target, damage, invaderXim.element.DARK, petskill)
    damage = invaderXim.summon.avatarFinalAdjustments(damage, pet, petskill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, 1)

    -- Effect
    if not target:hasStatusEffect(invaderXim.effect.WEIGHT) then
        local resist = invaderXim.mobskills.applyPlayerResistance(pet, -1, target, 0, invaderXim.skill.ELEMENTAL_MAGIC, invaderXim.element.DARK)

        if resist >= 0.15 then
            target:addStatusEffect(invaderXim.effect.WEIGHT, 50, 0, 120 * resist)
        end
    end

    return damage
end

return abilityObject
