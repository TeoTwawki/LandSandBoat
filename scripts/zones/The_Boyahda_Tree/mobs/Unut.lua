-----------------------------------
-- Area: The Boyahda Tree
--   NM: Unut
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 359)
end

return entity
