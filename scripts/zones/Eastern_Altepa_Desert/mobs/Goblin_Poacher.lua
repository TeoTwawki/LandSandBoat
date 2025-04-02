-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Goblin Poacher
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 113, 1, invaderXim.regime.type.FIELDS)
end

return entity
