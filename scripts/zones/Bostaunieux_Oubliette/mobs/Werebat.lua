-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Werebat
-- Note: PH for Arioch
-----------------------------------
local ID = zones[invaderXim.zone.BOSTAUNIEUX_OUBLIETTE]
-----------------------------------
---@type TMobEntity
local entity = {}

local ariochPHTable =
{
    [ID.mob.ARIOCH - 11] = ID.mob.ARIOCH, -- -259 0.489 -188
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 611, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, ariochPHTable, 10, 3600) -- 1 hour
end

return entity
