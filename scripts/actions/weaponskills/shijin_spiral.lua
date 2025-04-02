-----------------------------------
-- Shijin Spiral
-- Hand-to-Hand weapon skill
-- Skill Level: N/A
-- Delivers a fivefold attack that Plagues the target. Chance of inflicting Plague varies with TP.
-- In order to obtain Shijin Spiral, the quest Martial Mastery must be completed.
-- Aligned with the Flame Gorget, Light Gorget & Aqua Gorget.
-- Aligned with the Flame Belt, Light Belt & Aqua Belt.
-- Element: None
-- Modifiers: DEX: 73~85%
-- 100%TP    200%TP    300%TP
-- 1.0625    1.0625    1.0625
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params     = {}
    params.numHits   = 5
    params.ftpMod    = { 1.0625, 1.0625, 1.0625 }
    params.dex_wsc   = player:getMerit(invaderXim.merit.SHIJIN_SPIRAL) * 0.17
    params.atkVaries = { 1.05, 1.05, 1.05 }

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitfTP = true -- http://wiki.ffo.jp/html/25607.html
        params.ftpMod      = { 1.5, 1.5, 1.5 }
        params.dex_wsc     = 0.7 + player:getMerit(invaderXim.merit.SHIJIN_SPIRAL) * 0.03
    end

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Handle status effect
    local effectId      = invaderXim.effect.PLAGUE
    local actionElement = invaderXim.element.FIRE
    local power         = 5
    local duration      = math.floor(15 + 3 * tp / 1000)
    invaderXim.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
