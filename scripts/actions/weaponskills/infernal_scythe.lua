-----------------------------------
-- Infernal Scythe
-- Scythe weapon skill
-- Skill Level: 300
-- Deals darkness elemental damage and lowers target's attack. Duration of effect varies with TP.
-- Attack Down effect is -25% attack.
-- Aligned with the Shadow Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt & Aqua Belt.
-- Element: None
-- Modifiers: STR: 30% INT: 30%
-- 100%TP    200%TP    300%TP
-- 3.50        3.50      3.50
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params      = {}
    params.ftpMod     = { 3.5, 3.5, 3.5 }
    params.str_wsc    = 0.3
    params.int_wsc    = 0.3
    params.ele        = invaderXim.element.DARK
    params.skill      = invaderXim.skill.SCYTHE
    params.includemab = true

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.int_wsc = 0.7
    end

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    -- Handle status effect
    local effectId      = invaderXim.effect.ATTACK_DOWN
    local actionElement = invaderXim.element.WATER
    local power         = 25
    local duration      = math.floor(18 * tp / 100 * applyResistanceAddEffect(player, target, actionElement, 0))
    invaderXim.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
