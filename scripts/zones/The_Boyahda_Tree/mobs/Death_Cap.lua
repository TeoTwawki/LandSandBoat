-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Death Cap
-- Note: PH for Ellyllon
-----------------------------------
local ID = zones[invaderXim.zone.THE_BOYAHDA_TREE]
-----------------------------------
---@type TMobEntity
local entity = {}

local ellyllonPHTable =
{
    [ID.mob.ELLYLLON - 1] = ID.mob.ELLYLLON, -- 192.54 8.532 -163.41
}

local ellyllonsSpawnPoints =
{
    { x = 216.000, y = 8.129, z = -157.100 },
    { x = 209.000, y = 8.000, z = -151.000 },
    { x = 190.750, y = 8.500, z = -152.000 },
    { x = 200.000, y = 9.000, z = -167.000 },
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 719, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    local params = {}
    params.spawnPoints = ellyllonsSpawnPoints
    invaderXim.mob.phOnDespawn(mob, ellyllonPHTable, 10, 7200, params) -- 2 hours
end

return entity
