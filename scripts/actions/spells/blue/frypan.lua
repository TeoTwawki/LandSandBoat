-----------------------------------
-- Spell: Frypan
-- Delivers an area attack. Additional effect: "Stun." Accuracy varies with TP
-- Spell cost: 65 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: DEX+2
-- Level: 63
-- Casting Time: 1 seconds
-- Recast Time: 26 seconds
-- Skillchain Element(s): Impcation
-- Combos: Max HP Boost
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.BEASTMEN
    params.tpmod = invaderXim.spells.blue.tpMod.ACC
    params.bonusacc = 0
    if caster:hasStatusEffect(invaderXim.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(invaderXim.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end

    params.attackType = invaderXim.attackType.PHYSICAL
    params.damageType = invaderXim.damageType.BLUNT
    params.scattr = invaderXim.skillchainType.IMPACTION
    params.numhits = 1
    params.multiplier = 1.78
    params.tp150 = 1.78
    params.tp300 = 1.78
    params.azuretp = 1.78
    params.duppercap = 75
    params.str_wsc = 0.2
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.2
    params.chr_wsc = 0.0

    params.effect = invaderXim.effect.STUN
    local power = 1
    local tick = 0
    local duration = 5

    local damage = invaderXim.spells.blue.usePhysicalSpell(caster, target, spell, params)
    invaderXim.spells.blue.usePhysicalSpellAddedEffect(caster, target, spell, params, damage, power, tick, duration)

    return damage
end

return spellObject
