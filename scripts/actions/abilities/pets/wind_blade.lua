-----------------------------------
-- Wind Blade
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local tp = pet:getTP()

    -- Merit TP bonus.
    local merits = 0

    if summoner and summoner:isPC() then
        merits = summoner:getMerit(invaderXim.merit.WIND_BLADE)
    end

    tp = utils.clamp(tp + merits - 400, 0, 3000)

    --note: this formula is only accurate for level 75 - 76+ may have a different intercept and/or slope
    local damage = math.floor(512 + 0.172 * tp + (pet:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)) * 1.5)

    damage = invaderXim.mobskills.mobMagicalMove(pet, target, petskill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = invaderXim.mobskills.mobAddBonuses(pet, target, damage, invaderXim.element.WIND, petskill)
    damage = invaderXim.summon.avatarFinalAdjustments(damage, pet, petskill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, 1)

    target:takeDamage(damage, pet, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end

return abilityObject
