--[[ ------------------------------
Mobs that follow another mob while roaming.

This is useful when there is a designated leader and one or multiple followers such as with Ul'Xzomit.
This is not useful for mobs that can act as a leader and a follower such as the Slave Globes for Mother Globe.

This requires the invaderXim.mobMod.LEADER to be set appropriately for both the leader and followers.
The leader invaderXim.mobMod.LEADER should be a positive value designating how many followers it has.
The follower invaderXim.mobMod.LEADER should be a negative value designating the distance from the follower ID to the leader ID.

invaderXim.follow.assignLeaderMod() can be used during mob initialization to more easily assign the invaderXim.mobMod.LEADER.

----------------------------------- --]]
require('scripts/globals/mixins')
require('scripts/globals/utils')
-----------------------------------

g_mixins = g_mixins or {}

g_mixins.follow = function(followMob)
    followMob:addListener('SPAWN', 'FOLLOW_SPAWN', function(mob)
        local mobID = mob:getID()
        local leaderMod = mob:getMobMod(invaderXim.mobMod.LEADER)

        if leaderMod == 0 then
            return
        end

        -- Setup the leader mob
        if leaderMod > 0 then
            for i = 1, leaderMod do
                local follower = GetMobByID(mobID + i)
                if follower and follower:isSpawned() then
                    invaderXim.follow.follow(follower, mob)
                end
            end

            return
        end

        -- Setup the follower mob
        local leader = GetMobByID(mobID + leaderMod)
        if leader and leader:isSpawned() then
            invaderXim.follow.follow(mob, leader)
        end
    end)

    followMob:addListener('DEATH', 'FOLLOW_DEATH', function(mob)
        if mob:getMobMod(invaderXim.mobMod.LEADER) > 0 then
            invaderXim.follow.clearFollowers(mob)
        end
    end)
end

return g_mixins.follow
