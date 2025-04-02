-----------------------------------
-- Zantetsuken
-- Wanna bet this is made up?
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, skill, summoner, action)
    local returnParam = 0

    local power = summoner:getMP() / utils.clamp(summoner:getMaxMP(), 1, 9999)
    summoner:setMP(0)

    -- Damage
    if target:isNM() then
        local dmg = (target:getHP() + target:getHP() * power) / 10

        if dmg > 9999 then
            dmg = 9999
        end

        dmg = invaderXim.mobskills.mobMagicalMove(pet, target, skill, dmg, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 0)
        dmg = invaderXim.mobskills.mobAddBonuses(pet, target, dmg, invaderXim.element.DARK, skill)
        dmg = invaderXim.summon.avatarFinalAdjustments(dmg, pet, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, 1)

        target:takeDamage(dmg, pet, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)
        target:updateEnmityFromDamage(pet, dmg)

        returnParam = dmg

    -- Insta-kill: Highly innacurate against regular monsters.
    else
        local chance = 50 * power / utils.clamp(skill:getTotalTargets(), 1, 50)

        if
            math.random(1, 100) <= chance and
            target:getAnimation() ~= 33
        then
            skill:setMsg(invaderXim.msg.basic.SKILL_ENFEEB_IS)
            target:takeDamage(target:getHP(), pet, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)

            returnParam = invaderXim.effect.KO
        else
            skill:setMsg(invaderXim.msg.basic.EVADES)

            returnParam = 0
        end
    end

    return returnParam
end

return abilityObject
