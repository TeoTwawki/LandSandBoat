-----------------------------------
-- Area: West Ronfaure
--  Mob: Goblin Digger
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 56, 2, invaderXim.regime.type.FIELDS)
end

return entity
