-----------------------------------
-- Area: Batallia Downs [S]
--   NM: Burlibix Brawnback
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addMod(invaderXim.mod.STUN_MEVA, 50)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 494)
end

return entity
