-----------------------------------
-- Area: Quicksand Caves
--  Mob: Girtablulu
-- Note: Popped by qm3
-- Involved in Quest: Old Wounds
-- !pos -141.6 -2 450.48 208
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
