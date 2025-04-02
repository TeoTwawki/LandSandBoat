-----------------------------------
-- Camlann's Torment
-- Polearm weapon skill
-- Skill Level: EMPYREAN
-- Delivers a triple damage attack. DEF ignored varies with TP.
-- Will stack with Sneak Attack.
-- Element: None
-- Modifiers: VIT:60%
-- 100%TP    200%TP    300%TP
-- 3.00      3           3
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 3.0, 3.0, 3.0 }
    params.vit_wsc = 0.6
    params.ignoredDefense = { 0.15, 0.35, 0.50 }

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.6
    end

    -- Apply aftermath
    invaderXim.aftermath.addStatusEffect(player, tp, invaderXim.slot.MAIN, invaderXim.aftermath.type.EMPYREAN)

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
