-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Morion Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 1800)
    mob:setMod(invaderXim.mod.REGEN, 5)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
