-----------------------------------
-- Area: South Gustaberg
--   NM: Bubbly Bernie
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 80, 2, invaderXim.regime.type.FIELDS)
end

return entity
