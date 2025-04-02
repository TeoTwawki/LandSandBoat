-----------------------------------
--  MOB: Psycheflayer
-- Area: Nyzul Isle
-- Info: Specified Mob Group and Eliminate all Group
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.nyzul.specifiedEnemySet(mob)

    if mob:getPool() == 8072 then
        mob:setMobMod(invaderXim.mobMod.CHECK_AS_NM, 1)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.specifiedEnemyKill(mob)

        if mob:getID() >= 17092974 then
            invaderXim.nyzul.specifiedGroupKill(mob)
        end
    end
end

return entity
