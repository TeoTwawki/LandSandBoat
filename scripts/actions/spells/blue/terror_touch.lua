-----------------------------------
-- Spell: Terror Touch
-- Additional effect: Weakens attacks. Accuracy varies with TP
-- Spell cost: 62 MP
-- Monster Type: Undead
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5 MP+10
-- Level: 40
-- Casting Time: 3.25 seconds
-- Recast Time: 21 seconds
-- Duration: 60~ seconds
-- Skillchain Element(s): Compression/Reverberation
-- Combos: Defense Bonus
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.UNDEAD
    params.tpmod = invaderXim.spells.blue.tpMod.ACC
    params.bonusacc = 0
    if caster:hasStatusEffect(invaderXim.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(invaderXim.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end

    params.attackType = invaderXim.attackType.PHYSICAL
    params.damageType = invaderXim.damageType.HTH
    params.scattr = invaderXim.skillchainType.COMPRESSION
    params.scattr2 = invaderXim.skillchainType.REVERBERATION
    params.numhits = 1
    params.multiplier = 1.5
    params.tp150 = 1.5
    params.tp300 = 1.5
    params.azuretp = 1.5
    params.duppercap = 41
    params.str_wsc = 0.0
    params.dex_wsc = 0.2
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.effect = invaderXim.effect.ATTACK_DOWN
    local power = 15
    local tick = 0
    local duration = 60

    local damage = invaderXim.spells.blue.usePhysicalSpell(caster, target, spell, params)
    invaderXim.spells.blue.usePhysicalSpellAddedEffect(caster, target, spell, params, damage, power, tick, duration)

    return damage
end

return spellObject
