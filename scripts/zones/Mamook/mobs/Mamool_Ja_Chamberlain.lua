-----------------------------------
-- Area: Mamook
--  Mob: Mamool Ja Chamberlain (ZNM T3)
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
