-----------------------------------
-- Area: Ro'Maeve (122)
--  Mob: Eldhrimnir
-- Note: Popped by qm1
-- Involved in Quest: Orastery Woes
-- !pos 200.3 -11 -24.8 122
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
