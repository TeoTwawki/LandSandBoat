-----------------------------------
-- Area: Davoi
--  Mob: Davoi Mush
-- Note: PH for Blubbery Bulge
-----------------------------------
local ID = zones[invaderXim.zone.DAVOI]
-----------------------------------
---@type TMobEntity
local entity = {}

local blueberryPHTable =
{
    [ID.mob.BLUBBERY_BULGE - 1] = ID.mob.BLUBBERY_BULGE, -- -225.237 2.295 -294.764
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, blueberryPHTable, 20, 3600) -- 1 hour
end

return entity
