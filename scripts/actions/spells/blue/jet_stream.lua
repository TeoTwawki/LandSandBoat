-----------------------------------
-- Spell: Jet Stream
-- Delivers a threefold attack. Accuracy varies with TP
-- Spell cost: 47 MP
-- Monster Type: Birds
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 4
-- Stat Bonus: DEX+2
-- Level: 38
-- Casting Time: 0.5 seconds
-- Recast Time: 23 seconds
-- Skillchain Element(s): Impaction
-- Combos: Rapid Shot
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.BIRD
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
    params.numhits = 3
    params.multiplier = 1.125
    params.tp150 = 1.125
    params.tp300 = 1.125
    params.azuretp = 1.125
    params.duppercap = 39
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.3
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return invaderXim.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
