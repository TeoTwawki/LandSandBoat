-----------------------------------
-- Ability: Blade Bash
-- Deliver an attack that can stun the target and occasionally cause Plague.
-- Obtained: Samurai Level 75
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if not player:isWeaponTwoHanded() then
        return invaderXim.msg.basic.NEEDS_2H_WEAPON, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Stun rate
    if math.random(1, 100) < 99 then
        target:addStatusEffect(invaderXim.effect.STUN, 1, 0, 6)
    end

    -- Yes, even Blade Bash deals damage dependant of Dark Knight level
    local jobLevel = utils.getActiveJobLevel(player, invaderXim.job.DRK)
    local damage   = math.floor(player:getMod(invaderXim.mod.WEAPON_BASH) + (jobLevel + 11) / 4)

    -- Calculating and applying Blade Bash damage
    damage = utils.stoneskin(target, damage)
    target:takeDamage(damage, player, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    target:updateEnmityFromDamage(player, damage)

    -- Applying Plague based on merit level.
    if math.random(1, 100) < 65 then
        target:addStatusEffect(invaderXim.effect.PLAGUE, 5, 0, 15 + player:getMerit(invaderXim.merit.BLADE_BASH))
    end

    ability:setMsg(invaderXim.msg.basic.JA_DAMAGE)

    return damage
end

return abilityObject
