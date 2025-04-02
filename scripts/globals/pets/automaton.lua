-----------------------------------
-- PET: Automaton
-----------------------------------
xi = xi or {}
invaderXim.pets = invaderXim.pets or {}
invaderXim.pets.automaton = {}

invaderXim.pets.automaton.onMobSpawn = function(mob)
    mob:setLocalVar('MANEUVER_DURATION', 60)
    mob:addListener('EFFECTS_TICK', 'MANEUVER_DURATION', function(automaton)
        if automaton:getTarget() then
            local dur = automaton:getLocalVar('MANEUVER_DURATION')
            automaton:setLocalVar('MANEUVER_DURATION', math.min(dur + 3, 300))
        end
    end)

    -- Barrage Turbine cannot be used unless the automaton has been active for at least 3 minutes.
    mob:addRecast(invaderXim.recast.ABILITY, invaderXim.automaton.abilities.BARRAGE_TURBINE, 60 * 3)
end

invaderXim.pets.automaton.onMobDeath = function(mob)
    mob:removeListener('MANEUVER_DURATION')
end
