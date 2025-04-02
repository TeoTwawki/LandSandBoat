-----------------------------------
-- Area: Ifrits Cauldron
--   NM: Tarasque
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 900)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 403)
end

return entity
