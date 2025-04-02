-----------------------------------
-- Moonlit Charge M=4
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 4

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = invaderXim.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, 0, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 1, 2, 3)
    local totaldamage = invaderXim.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, numhits)
    target:addStatusEffect(invaderXim.effect.BLINDNESS, 20, 0, 30)
    target:takeDamage(totaldamage, pet, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

return abilityObject
