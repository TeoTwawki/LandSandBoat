-----------------------------------
-- Spell: Bludgeon
-- Delivers a threefold attack. Accuracy varies with TP
-- Spell cost: 16 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: STR+1
-- Level: 18
-- Casting Time: 0.5 seconds
-- Recast Time: 11.75 seconds
-- Skillchain Element(s): Liquefaction
-- Combos: Undead Killer
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.ARCANA
    params.tpmod = invaderXim.spells.blue.tpMod.ACC
    params.bonusacc = 0
    if caster:hasStatusEffect(invaderXim.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(invaderXim.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end

    params.attackType = invaderXim.attackType.PHYSICAL
    params.damageType = invaderXim.damageType.HTH
    params.scattr = invaderXim.skillchainType.LIQUEFACTION
    params.numhits = 3
    params.multiplier = 1.0
    params.tp150 = 1.0
    params.tp300 = 1.0
    params.azuretp = 1.0
    params.duppercap = 21
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.3

    return invaderXim.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
