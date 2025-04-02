-----------------------------------
-- Chains of Cowardice
-----------------------------------
local ID = zones[invaderXim.zone.EMPYREAL_PARADOX]
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local targets = mob:getEnmityList()
    for i, v in pairs(targets) do
        if v.entity:isPC() then
            local race = v.entity:getRace()
            if
                (race == invaderXim.race.TARU_M or race == invaderXim.race.TARU_F) and
                not v.entity:hasKeyItem(invaderXim.ki.LIGHT_OF_HOLLA)
            then
                mob:showText(mob, ID.text.PROMATHIA_TEXT + 2)
                return 0
            end
        end
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if
        target:isPC() and
        (
            (target:getRace() == invaderXim.race.TARU_M or target:getRace() == invaderXim.race.TARU_F) and
            not target:hasKeyItem(invaderXim.ki.LIGHT_OF_HOLLA)
        )
    then
        skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.TERROR, 30, 0, 30))
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
    end

    return invaderXim.effect.TERROR
end

return mobskillObject
