-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Goblin Mercenary
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 757, 1, invaderXim.regime.type.GROUNDS)
end

return entity
