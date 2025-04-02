-----------------------------------
--  VNM: Krabkatoa
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
    player:addTitle(invaderXim.title.KRABKATOA_STEAMER)
    invaderXim.voidwalker.onMobDeath(mob, player, optParams, invaderXim.keyItem.BLACK_ABYSSITE)
    invaderXim.hunts.checkHunt(mob, player, 544)
end

return entity
