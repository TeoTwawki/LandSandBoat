-----------------------------------
-- Area: Promyvion-Holla
--  Mob: Seether
-----------------------------------
mixins = { require('scripts/mixins/families/empty_terroanima') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.promyvion.emptyOnMobSpawn(mob, invaderXim.promyvion.mobType.SEETHER)
end

return entity
