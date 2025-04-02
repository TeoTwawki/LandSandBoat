-----------------------------------
-- Area: Pashhow Marshlands [S]
--   NM: Kinepikwa
-----------------------------------
mixins = {
    require('scripts/mixins/job_special'),
    require('scripts/mixins/families/peiste'),
}
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 507)
end

return entity
