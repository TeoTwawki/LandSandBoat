-----------------------------------
-- Roundhouse
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

-- http://wiki.ffo.jp/html/37928.html
abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 5.0

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = invaderXim.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, 0, invaderXim.mobskills.physicalTpBonus.CRIT_VARIES, 1, 1, 1)
    local totaldamage = invaderXim.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, numhits)

    invaderXim.job_utils.summoner.calculateTPReturn(pet, target, totaldamage, damage.hitslanded)

    target:takeDamage(totaldamage, pet, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

return abilityObject
