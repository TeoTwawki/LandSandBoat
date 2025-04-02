-----------------------------------
-- Glittering Ruby
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    --randomly give str/dex/vit/agi/int/mnd/chr (+12)
    local effects =
    {
        invaderXim.effect.STR_BOOST,
        invaderXim.effect.DEX_BOOST,
        invaderXim.effect.VIT_BOOST,
        invaderXim.effect.AGI_BOOST,
        invaderXim.effect.INT_BOOST,
        invaderXim.effect.MND_BOOST,
        invaderXim.effect.CHR_BOOST,
    }

    local effectId    = utils.randomEntry(effects)
    local effectPower = math.random(12, 14)

    target:addStatusEffect(effectId, effectPower, 0, 90)
    skill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT)

    return effectId
end

return mobskillObject
