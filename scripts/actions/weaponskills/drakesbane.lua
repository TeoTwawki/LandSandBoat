-----------------------------------
-- Drakesbane
-- Polearm weapon skill
-- Skill level: N/A
-- Delivers a fourfold attack. Chance of params.critical hit varies with TP. Ryunohige: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Dragoon) quest.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 4
    params.ftpMod = { 1.0, 1.0, 1.0 }
    params.str_wsc = 0.5
    params.critVaries = { 0.1, 0.3, 0.5 }
    params.atkVaries  = { 0.8125, 0.8125, 0.8125 }

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.critVaries = { 0.1, 0.25, 0.4 }
    end

    -- Apply Aftermath
    invaderXim.aftermath.addStatusEffect(player, tp, invaderXim.slot.MAIN, invaderXim.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
