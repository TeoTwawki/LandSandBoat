-----------------------------------
-- Area: Beadeaux [S]
--  Mob: Adaman Quadav
-- Note: PH for Ea'Tho Cruelheart and Ba'Tho Mercifulheart
-----------------------------------
local ID = zones[invaderXim.zone.BEADEAUX_S]
-----------------------------------
---@type TMobEntity
local entity = {}

local eathoPHTable =
{
    [ID.mob.EATHO_CRUELHEART - 1] = ID.mob.EATHO_CRUELHEART,
}

local bathoPHTable =
{
    [ID.mob.BATHO_MERCIFULHEART - 1] = ID.mob.BATHO_MERCIFULHEART,
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, eathoPHTable, 10, 7200) -- 2 hours
    invaderXim.mob.phOnDespawn(mob, bathoPHTable, 10, 7200) -- 2 hours
end

return entity
