-----------------------------------
-- Ability: Seigan
-- Grants a bonus to Third Eye when using two-handed weapons.
-- Obtained: Samurai Level 35
-- Recast Time: 1:00
-- Duration: 5:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if not target:isWeaponTwoHanded() then
        return invaderXim.msg.basic.NEEDS_2H_WEAPON, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    if target:isWeaponTwoHanded() then
        target:delStatusEffect(invaderXim.effect.HASSO)
        target:delStatusEffect(invaderXim.effect.SEIGAN)
        target:addStatusEffect(invaderXim.effect.SEIGAN, 0, 0, 300)
    end
end

return abilityObject
