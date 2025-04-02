-----------------------------------
-- Spell: Cold Wave
-- Deals ice damage that lowers Agility and gradually reduces HP of enemies within range
-- Spell cost: 37 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 1
-- Stat Bonus: INT-1
-- Level: 52
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Auto Refresh
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.ARCANA
    params.effect = invaderXim.effect.FROST
    params.attribute = invaderXim.mod.INT
    params.skillType = invaderXim.skill.BLUE_MAGIC
    local tick = 3
    local duration = 60
    local resistThreshold = 0.5
    local resist = applyResistanceEffect(caster, target, spell, params)

    -- Cannot apply if target has Burn
    if target:getStatusEffect(invaderXim.effect.BURN) ~= nil then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)

    elseif resist >= resistThreshold then

        -- Remove Choke on target
        if target:getStatusEffect(invaderXim.effect.CHOKE) ~= nil then
            target:delStatusEffect(invaderXim.effect.CHOKE)
        end

        local agiDown = utils.clamp(caster:getMainLvl() / 2, 0, 49)
        local dot = utils.clamp(math.floor((agiDown - 3) / 2), 0, 23)
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)

        if target:addStatusEffect(params.effect, dot, tick, duration * resist) then
            spell:setMsg(invaderXim.msg.basic.MAGIC_ENFEEB_IS)
        end
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end

return spellObject
