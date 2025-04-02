-----------------------------------
-- Chainspell
-- Meant for Qn'aern (RDM) with Ix'Aern encounter
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getPool() == 3269 and mob:getHPP() <= 70 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.CHAINSPELL, 1, 0, 60)

    skill:setMsg(invaderXim.msg.basic.USES)
    return invaderXim.effect.CHAINSPELL
end

return mobskillObject
