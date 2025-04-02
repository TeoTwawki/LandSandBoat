-----------------------------------
-- Area: Promyvion-Mea
--  Mob: Wanderer
-----------------------------------
mixins = { require('scripts/mixins/families/empty_terroanima') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.promyvion.emptyOnMobSpawn(mob, invaderXim.promyvion.mobType.WANDERER)
end

return entity
