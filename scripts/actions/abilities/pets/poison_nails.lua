-----------------------------------
-- Poison Nails  M=3? guess
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5

    local damage = invaderXim.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, 0, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 1, 2, 3)
    local totaldamage = invaderXim.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, numhits)

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    target:takeDamage(totaldamage, pet, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)
    target:updateEnmityFromDamage(pet, totaldamage)

    if
        invaderXim.summon.avatarPhysicalHit(petskill, totaldamage) and
        not target:hasStatusEffect(invaderXim.effect.POISON)
    then
        target:addStatusEffect(invaderXim.effect.POISON, 1, 3, 60)
    end

    return totaldamage
end

return abilityObject
