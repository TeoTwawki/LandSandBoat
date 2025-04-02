-----------------------------------
-- String Clipper
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
        numHits = 2,
        atkmulti = 1.25,
        weaponType = invaderXim.skill.SWORD,
        ftpMod = { 2.0, 2.0, 2.0 },
        str_wsc = 0.3,
        dex_wsc = 0.3,
    }

    if invaderXim.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 3.5, 3.5, 3.5 }
        params.accBonus = 0.05 * skill:getTP()
    end

    local damage = invaderXim.autows.doAutoPhysicalWeaponskill(automaton, target, 0, skill:getTP(), true, action, false, params, skill)

    return damage
end

return abilityObject
