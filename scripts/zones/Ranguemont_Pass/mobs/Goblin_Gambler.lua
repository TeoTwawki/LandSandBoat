-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Goblin Gambler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 604, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 605, 2, invaderXim.regime.type.GROUNDS)
end

return entity
