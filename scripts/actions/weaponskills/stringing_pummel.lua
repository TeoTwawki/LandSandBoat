-----------------------------------
-- Stringing Pummel
-- Sword weapon skill
-- Skill Level: N/A
-- Delivers a sixfold attack. Damage varies with TP.  Kenkonken: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Puppetmaster) quest.
-- Aligned with the Shadow Gorget, Soil Gorget & Flame Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Flame Belt.
-- Element: Darkness
-- Modifiers: STR:32% VIT:32%
-- 100%TP    200%TP    300%TP
-- 0.75      0.75      0.75
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 6
    params.ftpMod = { 0.75, 0.75, 0.75 }
    params.str_wsc = 0.32 params.vit_wsc = 0.32
    params.critVaries = { 0.15, 0.30, 0.45 }

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 1.0, 1.0, 1.0 }
        -- http://wiki.ffo.jp/html/15882.html
    end

    -- Apply Aftermath
    invaderXim.aftermath.addStatusEffect(player, tp, invaderXim.slot.MAIN, invaderXim.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
