-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Ambusher Antlion
-----------------------------------
mixins = { require('scripts/mixins/families/antlion_ambush') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 277)
end

return entity
