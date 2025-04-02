-----------------------------------
-- Area: Jugner Forest
--   NM: Supplespine Mujwuj
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 100)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 160)
end

return entity
