-----------------------------------
-- Area: Batallia Downs
--  Mob: Evil Weapon
-- Note: PH for Prankster Maverix
-----------------------------------
local ID = zones[invaderXim.zone.BATALLIA_DOWNS]
-----------------------------------
---@type TMobEntity
local entity = {}

local pranksterPHTable =
{
    [ID.mob.PRANKSTER_MAVERIX - 5] = ID.mob.PRANKSTER_MAVERIX,
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, pranksterPHTable, 15, 3600) -- 1 hour
end

return entity
