-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Pandemonium Lamp
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 900)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
