-----------------------------------
-- Area: Uleguerand Range
--   NM: Skvader
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 20)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 321)
end

return entity
