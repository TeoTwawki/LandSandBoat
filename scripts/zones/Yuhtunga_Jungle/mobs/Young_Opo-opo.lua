-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Young Opo-opo
-- Note: PH for Mischievous Micholas
-----------------------------------
local ID = zones[invaderXim.zone.YUHTUNGA_JUNGLE]
-----------------------------------
---@type TMobEntity
local entity = {}

local micholasPHTable =
{
    [ID.mob.MISCHIEVOUS_MICHOLAS - 1] = ID.mob.MISCHIEVOUS_MICHOLAS, -- -265.616 -0.5 -24.389
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 126, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 128, 1, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, micholasPHTable, 20, 3600) -- 1 hour
end

return entity
