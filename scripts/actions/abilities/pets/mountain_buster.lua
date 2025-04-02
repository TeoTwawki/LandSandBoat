-----------------------------------
-- Mountain Buster M=12
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 12
    local dmgmodsubsequent = 0

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = invaderXim.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, dmgmodsubsequent, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 1, 2, 3)
    local totaldamage = invaderXim.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, numhits)
    target:takeDamage(totaldamage, pet, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

return abilityObject
