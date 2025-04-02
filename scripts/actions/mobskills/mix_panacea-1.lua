-----------------------------------
-- Mix: Panacea-1 - Removes anything a Panacea can remove.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

local statii =
{
    invaderXim.effect.BIND,
    invaderXim.effect.WEIGHT,
    invaderXim.effect.ADDLE,
    invaderXim.effect.BURN,
    invaderXim.effect.FROST,
    invaderXim.effect.CHOKE,
    invaderXim.effect.RASP,
    invaderXim.effect.SHOCK,
    invaderXim.effect.DROWN,
    invaderXim.effect.DIA,
    invaderXim.effect.BIO,
    invaderXim.effect.SLOW,
    invaderXim.effect.ELEGY,
    invaderXim.effect.REQUIEM,
    invaderXim.effect.HELIX,
    invaderXim.effect.STR_DOWN,
    invaderXim.effect.DEX_DOWN,
    invaderXim.effect.VIT_DOWN,
    invaderXim.effect.AGI_DOWN,
    invaderXim.effect.INT_DOWN,
    invaderXim.effect.MND_DOWN,
    invaderXim.effect.CHR_DOWN,
    invaderXim.effect.MAX_HP_DOWN,
    invaderXim.effect.MAX_MP_DOWN,
    invaderXim.effect.ATTACK_DOWN,
    invaderXim.effect.EVASION_DOWN,
    invaderXim.effect.DEFENSE_DOWN,
    invaderXim.effect.MAGIC_DEF_DOWN,
    invaderXim.effect.INHIBIT_TP,
    invaderXim.effect.MAGIC_ACC_DOWN,
    invaderXim.effect.MAGIC_ATK_DOWN,
}

-- TODO: verify messaging
mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local lastEffect = 0
    for _, effect in pairs(statii) do
        if target:delStatusEffect(effect) then
            lastEffect = effect
            skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
            return lastEffect
        else
            skill:setMsg(invaderXim.msg.basic.NO_EFFECT)
        end
    end
end

return mobskillObject
