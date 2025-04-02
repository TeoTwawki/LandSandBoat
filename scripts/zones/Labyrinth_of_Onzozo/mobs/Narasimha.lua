-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Narasimha
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 12000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 30000)
    mob:setMobMod(invaderXim.mobMod.MUG_GIL, 4800)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 299)
end

return entity
