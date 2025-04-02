-----------------------------------
-- Welt
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

-- http://wiki.ffo.jp/html/37926.html
abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 3.0

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = invaderXim.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, 0, invaderXim.mobskills.physicalTpBonus.CRIT_VARIES, 1, 1, 1)
    local totaldamage = invaderXim.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, numhits)

    invaderXim.job_utils.summoner.calculateTPReturn(pet, target, totaldamage, damage.hitslanded)

    target:takeDamage(totaldamage, pet, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

return abilityObject
