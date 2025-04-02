-----------------------------------
-- Blade Yu
-- Katana weapon skill
-- Skill Level: 290
-- Delivers a water elemental attack. Additional effect Poison. Durration varies with TP.
-- Aligned with the Aqua Gorget & Soil Gorget.
-- Aligned with the Aqua Belt & Soil Belt.
-- Element: Water
-- Modifiers: DEX:50%  INT:50%
-- 100%TP    200%TP    300%TP
-- 2.25      2.25      2.25
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params      = {}
    params.ftpMod     = { 2.25, 2.25, 2.25 }
    params.dex_wsc    = 0.28
    params.int_wsc    = 0.28
    params.ele        = invaderXim.element.WATER
    params.skill      = invaderXim.skill.KATANA
    params.includemab = true

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod  = { 3, 3, 3 }
        params.dex_wsc = 0.4
        params.int_wsc = 0.4
    end

    local damage, tpHits, extraHits = invaderXim.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    -- Handle status effect
    local effectId      = invaderXim.effect.POISON
    local actionElement = invaderXim.element.WATER
    local power         = 10
    local duration      = math.floor((75 + 15 * tp / 1000) * applyResistanceAddEffect(player, target, actionElement, 0))
    invaderXim.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, false, damage
end

return weaponskillObject
