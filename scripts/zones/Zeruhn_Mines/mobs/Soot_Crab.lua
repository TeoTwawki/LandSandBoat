-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Soot Crab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 628, 2, invaderXim.regime.type.GROUNDS)
end

return entity
