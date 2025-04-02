-----------------------------------
-- Chains of Envy
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
                race == invaderXim.race.MITHRA and
                not v.entity:hasKeyItem(invaderXim.ki.LIGHT_OF_DEM)
            then
                mob:showText(mob, ID.text.PROMATHIA_TEXT + 3)
                return 0
            end
        end
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if
        target:isPC() and
        target:getRace() == invaderXim.race.MITHRA and
        not target:hasKeyItem(invaderXim.ki.LIGHT_OF_DEM)
    then
        skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.TERROR, 30, 0, 30))
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
    end

    return invaderXim.effect.TERROR
end

return mobskillObject
