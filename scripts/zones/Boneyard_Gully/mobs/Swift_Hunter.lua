-----------------------------------
-- Area: Boneyard Gully
--  Mob: Swift Hunter
-----------------------------------
mixins = { require('scripts/mixins/families/antlion_ambush') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    -- Aggros via ambush, not superlinking
    mob:setMobMod(invaderXim.mobMod.SUPERLINK, 0)
    mob:setMobMod(invaderXim.mobMod.NO_MOVE, 1)
end

entity.onMobEngage = function(mob, target)
    mob:setMobMod(invaderXim.mobMod.NO_MOVE, 0)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
