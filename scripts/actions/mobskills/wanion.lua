-----------------------------------
-- Wanion
-- Transfers all ailments the Seether itself has to players in AoE range.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- list of effects to give in AoE
    local effects = { invaderXim.effect.POISON, invaderXim.effect.PARALYSIS, invaderXim.effect.BLINDNESS, invaderXim.effect.SILENCE,
        invaderXim.effect.WEIGHT, invaderXim.effect.SLOW, invaderXim.effect.ADDLE, invaderXim.effect.DIA, invaderXim.effect.BIO, invaderXim.effect.BURN,
        invaderXim.effect.FROST, invaderXim.effect.CHOKE, invaderXim.effect.RASP, invaderXim.effect.SHOCK, invaderXim.effect.DROWN, invaderXim.effect.STR_DOWN,
        invaderXim.effect.DEX_DOWN, invaderXim.effect.VIT_DOWN, invaderXim.effect.AGI_DOWN, invaderXim.effect.INT_DOWN, invaderXim.effect.MND_DOWN,
        invaderXim.effect.CHR_DOWN, invaderXim.effect.ACCURACY_DOWN, invaderXim.effect.ATTACK_DOWN, invaderXim.effect.EVASION_DOWN,
        invaderXim.effect.DEFENSE_DOWN, invaderXim.effect.MAGIC_DEF_DOWN, invaderXim.effect.MAGIC_ACC_DOWN, invaderXim.effect.MAGIC_ATK_DOWN }

    for i, effect in ipairs(effects) do
        local currentEffect = mob:getStatusEffect(effect)

        if currentEffect then
            invaderXim.mobskills.mobStatusEffectMove(mob, target, effect, currentEffect:getPower(), currentEffect:getTick(), currentEffect:getTimeRemaining() / 1000)
            mob:delStatusEffect(effect)
        end
    end

    skill:setMsg(invaderXim.msg.basic.NONE)
end

return mobskillObject
