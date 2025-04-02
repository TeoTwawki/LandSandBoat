-----------------------------------
-- Area: Western Altepa Desert (125)
--  Mob: Maharaja
-- Note: Popped by qm1
-- Involved in Quest: Inheritance
-- !pos -652.3 0.2 -341.5 125
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
