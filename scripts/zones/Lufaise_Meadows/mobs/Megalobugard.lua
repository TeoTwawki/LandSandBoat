-----------------------------------
-- Area: Lufaise Meadows
--   NM: Megalobugard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(invaderXim.mod.REGEN, 25)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 439)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 154, 368, 582 })
end

return entity
