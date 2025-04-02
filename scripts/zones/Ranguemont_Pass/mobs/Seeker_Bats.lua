-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Seeker Bats
-- Note: PH for Gloom Eye
-----------------------------------
local ID = zones[invaderXim.zone.RANGUEMONT_PASS]
-----------------------------------
---@type TMobEntity
local entity = {}

local gloomEyePHTable =
{
    [ID.mob.GLOOM_EYE - 4] = ID.mob.GLOOM_EYE,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 603, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, gloomEyePHTable, 10, 3600) -- 1 hour
end

return entity
