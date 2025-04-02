-----------------------------------
-- Ukko's Fury
-- Great Axe Weapon Skill
-- Skill Level: N/A
-- Description: Delivers a twofold attack that slows target. Chance of params.critical hit varies with TP. Ukonvasara: Aftermath.
-- Available only when equipped with Ukonvasara (85), Ukonvasara (90), Ukonvasara (95), Maschu +1, Maschu +2.
-- Aligned with the Light Gorget, Breeze Gorget & Thunder Gorget.
-- Aligned with the Light Belt, Breeze Belt & Thunder Belt.
-- Element: None
-- Skillchain Properties: Light/Fragmentation
-- Modifiers: STR:80%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
-- 2.0        2.0        2.0
-- params.critical Chance added with TP:
-- 100%TP    200%TP    300%TP
-- 20%        35%        55%
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params      = {}
    params.numHits    = 2
    params.ftpMod     = { 2, 2, 2 }
    params.str_wsc    = 0.6
    params.critVaries = { 0.2, 0.35, 0.55 }

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.8
    end

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Apply aftermath
    invaderXim.aftermath.addStatusEffect(player, tp, invaderXim.slot.MAIN, invaderXim.aftermath.type.EMPYREAN)

    -- Handle status effect
    local effectId      = invaderXim.effect.SLOW
    local actionElement = invaderXim.element.EARTH
    local power         = 1500
    local duration      = math.floor(60 * applyResistanceAddEffect(player, target, actionElement, 0))
    invaderXim.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
