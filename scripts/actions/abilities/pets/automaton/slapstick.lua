-----------------------------------
-- Slapstick
-----------------------------------
---@type TAbilityAutomaton
local abilityObject = {}

abilityObject.onAutomatonAbilityCheck = function(target, automaton, skill)
    local master = automaton:getMaster()
    if not master then
        return
    end

    return master:countEffect(invaderXim.effect.THUNDER_MANEUVER)
end

abilityObject.onAutomatonAbility = function(target, automaton, skill, master, action)
    local params =
    {
        numHits = 3,
        atkmulti = 1,
        weaponType = invaderXim.skill.CLUB,
        ftpMod = { 1.5, 2.0, 3.0 },
        str_wsc = 0.3,
        dex_wsc = 0.3,
    }

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 2.66, 2.66, 2.66 }
        params.accBonus = 0.04 * skill:getTP()
    end

    local damage = invaderXim.autows.doAutoPhysicalWeaponskill(automaton, target, 0, skill:getTP(), true, action, false, params, skill)

    return damage
end

return abilityObject
