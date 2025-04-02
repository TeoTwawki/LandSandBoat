-----------------------------------
-- Area: Carpenters Landing
--   NM: Mycophile
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
    mob:addImmunity(invaderXim.immunity.SILENCE)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 166)
end

return entity
