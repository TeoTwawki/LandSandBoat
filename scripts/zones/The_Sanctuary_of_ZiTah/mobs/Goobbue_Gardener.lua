-----------------------------------
-- Area: The Sanctuary of ZiTah
--  Mob: Goobbue Gardener
-- Note: PH for Keeper of Halidom
-----------------------------------
local ID = zones[invaderXim.zone.THE_SANCTUARY_OF_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

local keeperPHTable =
{
    [ID.mob.KEEPER_OF_HALIDOM - 1] = ID.mob.KEEPER_OF_HALIDOM, -- 319.939 -0.037 187.231
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 114, 2, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, keeperPHTable, 10, 7200) -- 2 hours
end

return entity
