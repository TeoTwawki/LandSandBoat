-----------------------------------
-- Spell: Asuran Claws
-- Delivers a sixfold attack. Accuracy varies with TP
-- Spell cost: 81 MP
-- Monster Type: Beasts
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: AGI +3
-- Level: 70
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Skillchain Element(s): Liquefaction/Impaction
-- Combos: Counter
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.BEAST
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
    params.scattr2 = invaderXim.skillchainType.IMPACTION
    params.numhits = 6
    params.multiplier = 0.625
    params.tp150 = 0.625
    params.tp300 = 0.625
    params.azuretp = 0.625
    params.duppercap = 21
    -- D seems low for its level, but the spell never did good damage, so a low D is a good way of keeping overall damage down.
    -- More discussion on https://ffxiclopedia.fandom.com/wiki/Talk:Asuran_Claws
    params.str_wsc = 0.1
    params.dex_wsc = 0.1
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return invaderXim.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
