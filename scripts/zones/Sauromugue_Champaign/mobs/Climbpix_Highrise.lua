-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Climbpix Highrise
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 97, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 98, 2, invaderXim.regime.type.FIELDS)
end

return entity
