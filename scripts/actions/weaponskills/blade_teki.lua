-----------------------------------
-- Blade Teki
-- Katana weapon skill
-- Skill Level: 70
-- Decription: Deals water elemental damage. Damage varies with TP.
-- Aligned with the Aqua Gorget.
-- Aligned with the Aqua Belt.
-- Element: Water
-- Modifiers: STR:20%  INT:20%
-- 100%TP    200%TP    300%TP
-- 0.50      0.75      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 0.5, 0.75, 1.0 }
    params.str_wsc = 0.2 params.int_wsc = 0.2
    params.hybridWS = true
    params.ele = invaderXim.element.WATER
    params.skill = invaderXim.skill.KATANA
    params.includemab = true

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        -- http://wiki.ffo.jp/html/718.html
        params.str_wsc = 0.3 params.int_wsc = 0.3
        params.ftpMod = { 0.5, 1.375, 2.25 }
    end

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
