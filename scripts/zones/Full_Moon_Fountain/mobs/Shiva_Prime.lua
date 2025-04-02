-----------------------------------
-- Area: Full Moon Fountain
-- Mob: Shiva Prime
-- Quest: Waking the Beast
-- Note: most of the logic for this mob (such as spawning and 2hr) is handled
-- in the full moon fountain waking_the_beast battlefield file
-----------------------------------
local ID = zones[invaderXim.zone.FULL_MOON_FOUNTAIN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.UDMGPHYS, -6000)
    mob:setMod(invaderXim.mod.UDMGRANGE, -6000)
    mob:setMod(invaderXim.mod.UDMGMAGIC, -2000)
    mob:setMod(invaderXim.mod.ICE_ABSORB, 100)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.STUN)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.TERROR)
    -- element specific immunities
    mob:addImmunity(invaderXim.immunity.PARALYZE)
end

entity.onMobDeath = function(mob, player, optParams)
    if player then
        player:showText(mob, ID.text.WARPED_LOGIC)
    end
end

return entity
