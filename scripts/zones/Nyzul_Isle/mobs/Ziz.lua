-----------------------------------
--  MOB: Ziz
-- Area: Nyzul Isle
-----------------------------------
mixins = { require('scripts/mixins/families/ziz') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.nyzul.specifiedEnemySet(mob)
    mob:setAnimationSub(13)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.specifiedEnemyKill(mob)
    end
end

return entity
