-----------------------------------
-- Area: Beadeaux (254)
--  Mob: Brass Quadav
-- Note: PH for Bi'Gho Headtaker
-----------------------------------
local ID = zones[invaderXim.zone.BEADEAUX]
-----------------------------------
---@type TMobEntity
local entity = {}

local biGhoPHTable =
{
    [ID.mob.BI_GHO_HEADTAKER - 1] = ID.mob.BI_GHO_HEADTAKER, -- -98.611 0.498 71.212
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, biGhoPHTable, 10, math.random(3600, 10800)) -- 1 to 3 hours
end

return entity
