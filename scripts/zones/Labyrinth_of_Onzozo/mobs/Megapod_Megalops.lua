-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Megapod Megalops
-- Note: Popped by qm1
-- !pos 115 14.68 164.1 213
-- Involved in Quest: Bugi Soden
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.EXP_BONUS, -100)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
