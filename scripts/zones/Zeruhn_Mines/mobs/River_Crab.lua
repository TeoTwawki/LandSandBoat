-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: River Crab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 627, 1, invaderXim.regime.type.GROUNDS)
end

return entity
