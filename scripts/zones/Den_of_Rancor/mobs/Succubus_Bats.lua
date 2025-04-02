-----------------------------------
-- Area: Den of Rancor
--  Mob: Succubus Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 799, 1, invaderXim.regime.type.GROUNDS)
end

return entity
