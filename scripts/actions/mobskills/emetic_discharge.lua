-----------------------------------
-- Emetic Discharge
-- Family: Bloodlapper and Brummbar
-- Description: Transfers all ailments to target
-- Type: Enfeebling
-- Utsusemi/Blink absorb: 2-3 shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local removables = { invaderXim.effect.FLASH, invaderXim.effect.BLINDNESS, invaderXim.effect.ELEGY, invaderXim.effect.REQUIEM, invaderXim.effect.PARALYSIS, invaderXim.effect.POISON,
                        invaderXim.effect.CURSE_I, invaderXim.effect.CURSE_II, invaderXim.effect.DISEASE, invaderXim.effect.PLAGUE, invaderXim.effect.WEIGHT, invaderXim.effect.BIND,
                        invaderXim.effect.BIO, invaderXim.effect.DIA, invaderXim.effect.BURN, invaderXim.effect.FROST, invaderXim.effect.CHOKE, invaderXim.effect.RASP, invaderXim.effect.SHOCK, invaderXim.effect.DROWN,
                        invaderXim.effect.STR_DOWN, invaderXim.effect.DEX_DOWN, invaderXim.effect.VIT_DOWN, invaderXim.effect.AGI_DOWN, invaderXim.effect.INT_DOWN, invaderXim.effect.MND_DOWN,
                        invaderXim.effect.CHR_DOWN, invaderXim.effect.ADDLE, invaderXim.effect.SLOW, invaderXim.effect.HELIX, invaderXim.effect.ACCURACY_DOWN, invaderXim.effect.ATTACK_DOWN,
                        invaderXim.effect.EVASION_DOWN, invaderXim.effect.DEFENSE_DOWN, invaderXim.effect.MAGIC_ACC_DOWN, invaderXim.effect.MAGIC_ATK_DOWN, invaderXim.effect.MAGIC_EVASION_DOWN,
                        invaderXim.effect.MAGIC_DEF_DOWN, invaderXim.effect.MAX_TP_DOWN, invaderXim.effect.MAX_MP_DOWN, invaderXim.effect.MAX_HP_DOWN }

    local dmg = utils.takeShadows(target, 1, math.random(2, 3)) --removes 2-3 shadows
    --if removed more shadows than were up or there weren't any
    if dmg > 0 then
        for _, effect in ipairs(removables) do
            local statusEffect = mob:getStatusEffect(effect)

            if statusEffect then
                target:addStatusEffect(effect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())
                mob:delStatusEffect(effect)
            end
        end
    end

    skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT) -- no effect
    return 0
end

return mobskillObject
