-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Bodach
-- Note: Popped by qm1
-- Involved in Quest: The Walls of Your Mind
-- !pos 29 16 -140 167
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
