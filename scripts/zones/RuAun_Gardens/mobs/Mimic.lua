-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Mimic
-----------------------------------
mixins = { require('scripts/mixins/families/mimic') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

return entity
