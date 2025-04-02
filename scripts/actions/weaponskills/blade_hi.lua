-----------------------------------
-- Blade Hi
-- Katana weapon skill
-- Skill level: N/A
-- Description: Deals quadruple damage. Chance of params.critical hit varies with TP. Kannagi: Aftermath.
-- Available only when equipped with Kannagi (85)/(90)/(95)/(99) or Tobi +1/+2/+3.
-- Aligned with the Shadow Gorget & Soil Gorget.
-- Aligned with the Shadow Belt & Soil Belt.
-- Element: None
-- Modifiers: AGI:60%
-- Skillchain Properties: Darkness/Gravitation
-- 100%TP    200%TP    300%TP
-- 4.00      4.00      4.00
-----------------------------------
-- params.critical Hit Rate by TP:
-- 100%TP    200%TP    300%TP
-- 15%         20%       25%
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 4.0, 4.0, 4.0 }
    params.agi_wsc = 0.6
    params.critVaries = { 0.15, 0.20, 0.25 }

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 5.0, 5.0, 5.0 }
        params.agi_wsc = 0.8
    end

    -- Apply aftermath
    invaderXim.aftermath.addStatusEffect(player, tp, invaderXim.slot.MAIN, invaderXim.aftermath.type.EMPYREAN)

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
