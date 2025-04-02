-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Ochu
-- Note: PH for Drooling Daisy
-----------------------------------
local ID = zones[invaderXim.zone.ROLANBERRY_FIELDS]
-----------------------------------
---@type TMobEntity
local entity = {}

local droolingPHTable =
{
    [ID.mob.DROOLING_DAISY - 1] = ID.mob.DROOLING_DAISY, -- -691.786 -34.802 -335.763
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 88, 1, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, droolingPHTable, 10, 3600) -- 1 hour
end

return entity
