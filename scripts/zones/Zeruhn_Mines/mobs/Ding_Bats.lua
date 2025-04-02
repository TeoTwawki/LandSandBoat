-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Ding Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 626, 1, invaderXim.regime.type.GROUNDS)
end

return entity
