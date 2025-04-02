-----------------------------------
-- Area: East Ronfaure [S]
--  Mob: Battrap
-- Note: PH for Goblintrap
-----------------------------------
local ID = zones[invaderXim.zone.EAST_RONFAURE_S]
-----------------------------------
---@type TMobEntity
local entity = {}

local goblintrapPHTable =
{
    [ID.mob.GOBLINTRAP - 1] = ID.mob.GOBLINTRAP, -- 156 0 -438
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, goblintrapPHTable, 5, 3600) -- 1 hour
end

return entity
