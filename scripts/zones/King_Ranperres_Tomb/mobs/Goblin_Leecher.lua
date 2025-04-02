-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Goblin Leecher
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 631, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 635, 2, invaderXim.regime.type.GROUNDS)
end

return entity
