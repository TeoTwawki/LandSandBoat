-----------------------------------
-- Herculean Slash
-- Great Sword weapon skill
-- Skill Level: 290
-- Paralyzes target. Duration of effect varies with TP.
-- Aligned with the Snow Gorget, Thunder Gorget & Breeze Gorget.
-- Aligned with the Snow Belt, Thunder Belt & Breeze Belt.
-- Element: Ice
-- Modifiers: VIT:60%
-- As this is a magic-based weaponskill it is also modified by Magic Attack Bonus.
-- 100%TP    200%TP    300%TP
-- 3.50      3.50      3.50
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params      = {}
    params.ftpMod     = { 3.5, 3.5, 3.5 }
    params.vit_wsc    = 0.6
    params.ele        = invaderXim.element.ICE
    params.skill      = invaderXim.skill.GREAT_SWORD
    params.includemab = true

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.vit_wsc = 0.8
    end

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    -- Handle status effect
    local effectId      = invaderXim.effect.PARALYSIS
    local actionElement = invaderXim.element.ICE
    local power         = 30
    local duration      = math.floor(6 * tp / 100 * applyResistanceAddEffect(player, target, actionElement, 0))
    invaderXim.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
