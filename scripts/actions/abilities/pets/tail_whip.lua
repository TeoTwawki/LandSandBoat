-----------------------------------
-- Tail Whip M=5
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 5

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = invaderXim.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, 0, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 1, 2, 3)
    local totaldamage = invaderXim.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, numhits)

    local duration = 120
    local resm = invaderXim.mobskills.applyPlayerResistance(pet, -1, target, pet:getStat(invaderXim.mod.INT)-target:getStat(invaderXim.mod.INT), invaderXim.skill.ELEMENTAL_MAGIC, 5)
    if resm < 0.25 then
        resm = 0
    end

    duration = duration * resm

    if
        duration > 0 and
        invaderXim.summon.avatarPhysicalHit(petskill, totaldamage) and
        not target:hasStatusEffect(invaderXim.effect.WEIGHT)
    then
        target:addStatusEffect(invaderXim.effect.WEIGHT, 50, 0, duration)
    end

    target:takeDamage(totaldamage, pet, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

return abilityObject
