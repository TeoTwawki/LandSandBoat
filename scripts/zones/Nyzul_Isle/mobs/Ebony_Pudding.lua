-----------------------------------
--  MOB: Ebony Pudding
-- Area: Nyzul Isle
-- Info: Specified Mob Group
-----------------------------------
mixins = { require('scripts/mixins/families/flan') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.CHECK_AS_NM, 1)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.specifiedGroupKill(mob)
        invaderXim.nyzul.specifiedEnemyKill(mob)
    end
end

return entity
