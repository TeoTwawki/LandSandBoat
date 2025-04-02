-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Tonberry Kinq
-----------------------------------
mixins =
{
    require('scripts/mixins/families/tonberry'),
    require('scripts/mixins/job_special')
}
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 18000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 30000)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
