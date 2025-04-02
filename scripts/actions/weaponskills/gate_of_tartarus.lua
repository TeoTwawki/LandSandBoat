-----------------------------------
-- Gate Of Tartarus
-- Staff weapon skill
-- Skill Level: N/A
-- Lowers target's attack. Additional effect: Refresh
-- Refresh effect is 8mp/tick for 20 sec per 100 TP.
-- Available only when equipped with the Relic Weapons Thyrus (Dynamis use only) and Claustrum, or the Chthonic Staff once the Latent Effect has been activated.
-- These Relic Weapons are only available to Black Mages and Summoners. As such, only these jobs may use this Weapon Skill.
-- Aligned with the Aqua Gorget & Snow Gorget.
-- Aligned with the Aqua Belt & Snow Belt.
-- Element: None
-- Modifiers: CHR:60%
-- 100%TP    200%TP    300%TP
-- 3.00      3.00      3.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params   = {}
    params.numHits = 1
    params.ftpMod  = { 3, 3, 3 }
    params.chr_wsc = 0.6

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.chr_wsc = 0.8
    end

    -- Apply aftermath
    invaderXim.aftermath.addStatusEffect(player, tp, invaderXim.slot.MAIN, invaderXim.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = invaderXim.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Handle status effect
    local effectId      = invaderXim.effect.ATTACK_DOWN
    local actionElement = invaderXim.element.WATER
    local power         = 20
    local duration      = math.floor(120 * applyResistanceAddEffect(player, target, actionElement, 0))
    invaderXim.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
