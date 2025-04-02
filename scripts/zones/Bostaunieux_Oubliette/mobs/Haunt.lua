-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Haunt
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 612, 2, invaderXim.regime.type.GROUNDS)
end

return entity
