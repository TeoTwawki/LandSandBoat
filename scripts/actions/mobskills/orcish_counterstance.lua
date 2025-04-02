-----------------------------------
-- Orcish Counterstance
-- Used only by Orcs in Wings of the Goddess Areas.
-- Certain NMs may have a higher power version of the invaderXim.effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getContinentID() == invaderXim.continent.THE_SHADOWREIGN_ERA then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- local power = 10
    -- local duration = 60

    -- if Conquerer Bakgodek then
        -- power = 50? He's not implemented yet anyway :P
    -- end

    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.COUNTERSTANCE, 10, 0, 60))

    return invaderXim.effect.COUNTERSTANCE
end

return mobskillObject
