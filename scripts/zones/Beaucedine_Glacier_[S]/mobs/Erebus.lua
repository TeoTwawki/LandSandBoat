-----------------------------------
--  VNM: Erebus
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    invaderXim.voidwalker.onMobInitialize(mob)
end

entity.onMobSpawn = function(mob)
    invaderXim.voidwalker.onMobSpawn(mob)
end

entity.onMobFight = function(mob, target)
    invaderXim.voidwalker.onMobFight(mob, target)
end

entity.onMobDisengage = function(mob)
    invaderXim.voidwalker.onMobDisengage(mob)
end

entity.onMobDespawn = function(mob)
    invaderXim.voidwalker.onMobDespawn(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.voidwalker.onMobDeath(mob, player, optParams, invaderXim.keyItem.PURPLE_ABYSSITE)
    invaderXim.hunts.checkHunt(mob, player, 557)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 782 })
end

return entity
