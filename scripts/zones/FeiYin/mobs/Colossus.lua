-----------------------------------
-- Area: FeiYin
--  Mob: Colossus
-- Note: PH for Goliath
-----------------------------------
local ID = zones[invaderXim.zone.FEIYIN]
-----------------------------------
---@type TMobEntity
local entity = {}

local goliathPHTable =
{
    [ID.mob.GOLIATH + 7] = ID.mob.GOLIATH,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 715, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, goliathPHTable, 10, 3600) -- 1 hour
end

return entity
