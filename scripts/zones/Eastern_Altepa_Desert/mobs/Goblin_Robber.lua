-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Goblin Robber
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 113, 2, invaderXim.regime.type.FIELDS)
end

return entity
