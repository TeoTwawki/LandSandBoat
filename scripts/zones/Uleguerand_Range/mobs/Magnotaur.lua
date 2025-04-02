-----------------------------------
-- Area: Uleguerand Range
--   NM: Magnotaur
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(invaderXim.mod.REGAIN, 50)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 322)
end

return entity
