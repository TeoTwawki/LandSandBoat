-----------------------------------
--  MOB: Zizzy Zillah
-- Area: Nyzul Isle
-- Info: NM
-----------------------------------
mixins = { require('scripts/mixins/families/ziz') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setAnimationSub(13)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.eliminateAllKill(mob)
    end
end

return entity
