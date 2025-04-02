-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Gigas Kettlemaster
-- Note: PH for Ophion
-----------------------------------
local ID = zones[invaderXim.zone.MIDDLE_DELKFUTTS_TOWER]
-----------------------------------
---@type TMobEntity
local entity = {}

local ophionPHTable =
{
    [ID.mob.OPHION - 16] = ID.mob.OPHION, -- -453 -95.529 -1
    [ID.mob.OPHION - 11] = ID.mob.OPHION, -- -409.937 -95.772 48.785
    [ID.mob.OPHION - 2]  = ID.mob.OPHION, -- -384 -95.529 14
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 783, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 784, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, ophionPHTable, 5, math.random(7200, 14400)) -- 2 to 4 hours (could not find info, so using Ogygos' cooldown)
end

return entity
