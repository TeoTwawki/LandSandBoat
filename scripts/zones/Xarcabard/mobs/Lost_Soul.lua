-----------------------------------
-- Area: Xarcabard
--  Mob: Lost Soul
-- Note: PH for Timeworn Warrior
-----------------------------------
local ID = zones[invaderXim.zone.XARCABARD]
-----------------------------------
---@type TMobEntity
local entity = {}

local timewornPHTable =
{
    [ID.mob.TIMEWORN_WARRIOR - 4] = ID.mob.TIMEWORN_WARRIOR,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 51, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 52, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 53, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 54, 3, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, timewornPHTable, 5, 5400) -- 90 minutes
end

return entity
