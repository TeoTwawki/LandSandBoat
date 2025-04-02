-----------------------------------
-- Area: Uleguerand Range
--   NM: Geush Urvan
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 1800)
end

return entity
