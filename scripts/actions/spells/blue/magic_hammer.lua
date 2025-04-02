-----------------------------------
-- Spell: Magic Hammer
-- Steals an amount of enemy's MP equal to damage dealt. Ineffective against undead.
-- Spell cost: 40 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: MP-5, MND+2
-- Level: 74
-- Casting Time: 4 seconds
-- Recast Time: 180 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Magic Attack Bonus
-- Notes:
-- Modifiers: MND 30%.
-- Affected by Magic Attack Bonus.
-- The bonus from Light Staff/Apollo's Staff affects both accuracy and amount of MP drained.
-- The bonuses from weather/day effects and Korin/Hachirin-no-Obi affect both accuracy and amount of MP drained.
-- Can only drain MP from targets that have MP and cannot drain more MP than the target has.
-- Damage and MP drained are enhanced by both Magic Attack Bonus and Magic Attack from Convergence.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.BEASTMEN
    params.attackType = invaderXim.attackType.MAGICAL
    params.damageType = invaderXim.damageType.LIGHT
    params.attribute = invaderXim.mod.MND
    params.multiplier = 1.5
    params.azureBonus = 0.5
    params.tMultiplier = 1.0
    params.duppercap = 35
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0

    local damage = 0
    if target:isUndead() then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    else
        damage = invaderXim.spells.blue.useMagicalSpell(caster, target, spell, params)

        local mpDrained = utils.clamp(damage, 0, target:getMP())
        if mpDrained == 0 then
            spell:setMsg(invaderXim.msg.basic.MAGIC_DMG)
        else
            damage = mpDrained
            caster:addMP(damage)
            target:delMP(damage)
            spell:setMsg(invaderXim.msg.basic.MAGIC_DRAIN_MP)
        end
    end

    return damage
end

return spellObject
