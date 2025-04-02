-----------------------------------
-- Area: Gusgen Mines
--  Mob: Gallinipper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 684, 2, invaderXim.regime.type.GROUNDS)
end

return entity
