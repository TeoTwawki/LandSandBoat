-----------------------------------
-- Area: Den of Rancor
--   NM: Mokumokuren
-- Note: Popped by qm2
-- !pos 117 36 -280 160
-- Involved in Quest: Souls in Shadow
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
