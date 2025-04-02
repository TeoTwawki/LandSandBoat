-----------------------------------
-- Perfect Defense
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onPetAbility = function(target, pet, skill, master)
    local power = 10000 * (master:getMP() / master:getMaxMP())
    local duration = 60

    if master ~= nil then
        local summoningSkill = master:getSkillLevel(invaderXim.skill.SUMMONING_MAGIC)
        if summoningSkill > 600 then
            summoningSkill = 600
        end

        duration = 30 + summoningSkill / 20
        master:setMP(0)
    end

    target:delStatusEffect(invaderXim.effect.PERFECT_DEFENSE)
    target:addStatusEffect(invaderXim.effect.PERFECT_DEFENSE, power, 3, duration)
    skill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT)

    return invaderXim.effect.PERFECT_DEFENSE
end

return abilityObject
