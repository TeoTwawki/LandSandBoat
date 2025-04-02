-----------------------------------
-- Area: Talacca Cove
--   NM: Imp Bandsman
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(invaderXim.immunity.POISON)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.SLOW)
    mob:addImmunity(invaderXim.immunity.PARALYZE)
    mob:setMobMod(invaderXim.mobMod.SIGHT_RANGE, 25)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
