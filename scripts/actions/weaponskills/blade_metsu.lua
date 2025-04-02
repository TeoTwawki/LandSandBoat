-----------------------------------
-- Blade Metsu
-- Katana weapon skill
-- Skill Level: N/A
-- Additional effect: Paralysis
-- Hidden effect: temporarily enhances Subtle Blow invaderXim.effect.
-- One hit weapon skill, despite non single-hit animation.
-- This weapon skill is only available with the stage 5 relic Katana Kikoku or within Dynamis with the stage 4 Yoshimitsu.
-- Weaponskill is also available with the Sekirei Katana obtained from Abyssea NM Sedna.
-- Aligned with the Shadow Gorget, Breeze Gorget & Thunder Gorget.
-- Aligned with the Shadow Belt, Breeze Belt & Thunder Belt.
-- Element: None
-- Modifiers: DEX:60%
-- 100%TP    200%TP    300%TP
-- 3.00      3.00      3.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params   = {}
    params.numHits = 1
    params.ftpMod  = { 3, 3, 3 }
    params.dex_wsc = 0.6

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod  = { 5, 5, 5 }
        params.dex_wsc = 0.8
    end

    -- Apply aftermath
    invaderXim.aftermath.addStatusEffect(player, tp, invaderXim.slot.MAIN, invaderXim.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Handle status effect
    local effectId      = invaderXim.effect.PARALYSIS
    local actionElement = invaderXim.element.ICE
    local power         = 10
    local duration      = math.floor(60 * applyResistanceAddEffect(player, target, actionElement, 0))
    invaderXim.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
