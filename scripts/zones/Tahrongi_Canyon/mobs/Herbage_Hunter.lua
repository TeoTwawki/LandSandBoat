-----------------------------------
-- Area: Tahrongi Canyon
--   NM: Herbage Hunter
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 45)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 259)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 431 })
end

return entity
