-----------------------------------
-- Area: Yuhtunga Jungle
--   NM: Mischievous Micholas
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 362)
    invaderXim.regime.checkRegime(player, mob, 126, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 128, 1, invaderXim.regime.type.FIELDS)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 780 })
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
end

return entity
