-----------------------------------
-- Regal Scratch
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    -- local params = {}
    -- params.str_wsc = 0.0 params.dex_wsc = 0.3 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    -- params.ele = invaderXim.element.LIGHT
    local numhits          = 3
    local accmod           = -5
    local dmgmod           = 3
    local dmgmodsubsequent = 1

    local damage      = invaderXim.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, dmgmodsubsequent, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 1, 2, 3)
    local totaldamage = invaderXim.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, numhits)

    target:takeDamage(totaldamage, pet, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

return abilityObject
