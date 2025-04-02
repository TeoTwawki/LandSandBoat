-----------------------------------
-- Area: Batallia Downs [S]
--   NM: Habergoass
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(invaderXim.mod.REGAIN, 75)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 493)
end

return entity
