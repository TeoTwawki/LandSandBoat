-----------------------------------
-- Sonic Buffet
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

-- http://wiki.ffo.jp/html/37931.html
abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    -- TODO: upon smn BP damage rewrite, the base damage & mods etc need to be re-evaluated.
    -- fTP starts at 2.0 and scales every 150 tp by .1 for a range of 2.0 to 4.0. Base value ballparked from retail.
    local damage = math.floor(37.5 * (2 + 0.1 * pet:getTP() / 150) + (pet:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)) * 1.5)

    damage = invaderXim.mobskills.mobMagicalMove(pet, target, petskill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = invaderXim.mobskills.mobAddBonuses(pet, target, damage, invaderXim.element.WIND, petskill)
    damage = invaderXim.summon.avatarFinalAdjustments(damage, pet, petskill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, 1)

    target:takeDamage(damage, pet, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)
    target:updateEnmityFromDamage(pet, damage)

    local resist = applyResistanceAbility(pet, target, invaderXim.element.WIND, invaderXim.skill.NONE, 0) -- Does this get bonus macc from SMN skill?
    if resist > 0.0625 then -- Is there _any_ circumstance wherein a dispel adds a message? Based on testing it seems the ability is magic damage only visibly.
        target:dispelStatusEffect()
    end

    pet:setTP(0) -- not possible to get Occult Acumen on avatars yet, so unable to determine if magical BPs can return TP.
    return damage
end

return abilityObject
