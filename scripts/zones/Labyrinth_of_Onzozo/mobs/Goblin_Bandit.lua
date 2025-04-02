-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Goblin Bandit
-- Note: Place holder Soulstealer Skullnix
-----------------------------------
local ID = zones[invaderXim.zone.LABYRINTH_OF_ONZOZO]
-----------------------------------
---@type TMobEntity
local entity = {}

local soulstealerPHTable =
{
    [ID.mob.SOULSTEALER_SKULLNIX + 13] = ID.mob.SOULSTEALER_SKULLNIX, -- 5.096 3.930 166.865
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 771, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 772, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 774, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, soulstealerPHTable, 5, math.random(7200, 10800)) -- 2 to 3 hours
end

return entity
