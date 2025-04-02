-----------------------------------
-- Rudra's Storm
-- Dagger weapon skill
-- Skill level: N/A
-- Deals triple damage and weighs target down (duration: 60s). Damage varies with TP.
-- Aligned with the Aqua Gorget, Snow Gorget & Shadow Gorget.
-- Aligned with the Aqua Belt, Snow Belt & Shadow Belt.
-- Element: None
-- Modifiers: DEX:80%
-- 100%TP    200%TP    300%TP
-- 6          15        19.5
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params   = {}
    params.numHits = 1
    params.ftpMod  = { 3.25, 4.25, 5.25 }
    params.dex_wsc = 0.6

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 5, 10.19, 13 }
        params.dex_wsc = 0.8
    end

    -- Apply aftermath
    invaderXim.aftermath.addStatusEffect(player, tp, invaderXim.slot.MAIN, invaderXim.aftermath.type.EMPYREAN)

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Handle status effect
    local effectId      = invaderXim.effect.WEIGHT
    local actionElement = invaderXim.element.WIND
    local power         = 25
    local duration      = 60
    invaderXim.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
