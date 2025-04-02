-----------------------------------
-- Area: West Ronfaure
--  Mob: Marauder Dvogzog
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 4, 1, invaderXim.regime.type.FIELDS)
end

return entity
