-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Goblin Alchemist
-----------------------------------
local ID = zones[invaderXim.zone.IFRITS_CAULDRON]
-----------------------------------
---@type TMobEntity
local entity = {}

local foreseerPHTable =
{
    [ID.mob.FORESEER_ORAMIX - 7] = ID.mob.FORESEER_ORAMIX,
    [ID.mob.FORESEER_ORAMIX + 4] = ID.mob.FORESEER_ORAMIX,
    [ID.mob.FORESEER_ORAMIX + 7] = ID.mob.FORESEER_ORAMIX,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 757, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, foreseerPHTable, 5, 3600) -- 1 hour
end

return entity
