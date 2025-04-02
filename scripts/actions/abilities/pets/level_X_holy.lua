-----------------------------------
-- Level X Holy
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)
    local damage            = 0
    local holyRollOneAnimID = 164
    local primaryTargetID   = action:getPrimaryTargetID()

    -- If primary target, roll for power by setting random animation.
    -- We do this so the animation is random, but only rolled for once. (AKA: The same for all targets)
    if primaryTargetID == target:getID() then
        action:setAnimation(primaryTargetID, holyRollOneAnimID + math.random(0, 5))
    else
        local animationId = action:getAnimation(primaryTargetID)
        if animationId then
            action:setAnimation(target:getID(), animationId)
        end
    end

    local power = action:getAnimation(target:getID()) - 163

    -- Only have an effect if target's level is divisible by die roll
    if target:getMainLvl() % power == 0 then
        damage = math.floor(pet:getMainLvl() * power + (pet:getStat(invaderXim.mod.MND) - target:getStat(invaderXim.mod.MND)) * 1.5)

        damage = invaderXim.mobskills.mobMagicalMove(pet, target, petskill, damage, invaderXim.element.LIGHT, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 10)
        damage = invaderXim.mobskills.mobAddBonuses(pet, target, damage, invaderXim.element.LIGHT, petskill)
        damage = invaderXim.summon.avatarFinalAdjustments(damage, pet, petskill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT, 1)

        -- TODO: Magic burst?

        target:takeDamage(damage, pet, invaderXim.attackType.MAGICAL, invaderXim.element.LIGHT)
        target:updateEnmityFromDamage(pet, damage)
    else
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
    end

    return damage
end

return abilityObject
