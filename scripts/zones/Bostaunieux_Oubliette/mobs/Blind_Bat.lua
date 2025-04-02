-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Blind Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 615, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 617, 2, invaderXim.regime.type.GROUNDS)
end

return entity
