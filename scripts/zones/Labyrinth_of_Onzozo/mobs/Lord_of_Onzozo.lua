-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Lord of Onzozo
-----------------------------------
mixins =
{
    require('scripts/mixins/rage'),
    require('scripts/mixins/draw_in'),
}
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 774, 1, invaderXim.regime.type.GROUNDS)
end

return entity
