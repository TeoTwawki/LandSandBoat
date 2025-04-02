-----------------------------------
-- Area: Full Moon Fountain
-- Mob: Carbuncle Prime
-- Quest: Waking the Beast
-- Note: most of the logic for this mob (such as despawning, respawning, and 2hr) is handled
-- in the full moon fountain waking_the_beast battlefield file
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    -- carbuncle prime does not have UDMGPHYS like other elemental primes
    mob:setMod(invaderXim.mod.UDMGMAGIC, -2000)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.PARALYZE)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.BLIND)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
end

entity.onMobWeaponSkillPrepare = function(mob, target)
    -- use healing_ruby_ii with only a 5% chance (as much rarer than the other carby skills)
    if math.random(1, 20) == 1 then
        return 911
    else
        return ({ 907, 908, 909, 910 })[math.random(1, 4)]
    end
end

return entity
