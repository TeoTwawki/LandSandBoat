-----------------------------------
-- Area: Qulun Dome
--   NM: Za'Dha Adamantking
-- TODO: messages should be zone-wide
-----------------------------------
local ID = zones[invaderXim.zone.QULUN_DOME]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobEngage = function(mob, target)
    mob:showText(mob, ID.text.QUADAV_KING_ENGAGE)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.SLOW, { power = 3000 })
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.ADAMANTKING_USURPER)
    if optParams.isKiller then
        mob:showText(mob, ID.text.QUADAV_KING_DEATH)
    end
end

entity.onMobDespawn = function(mob)
    -- reset hqnm system back to the nm placeholder
    local nqId = mob:getID() - 1
    SetServerVariable('[POP]Za_Dha_Adamantking', os.time() + 259200) -- 3 days
    SetServerVariable('[PH]Za_Dha_Adamantking', 0)
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(nqId, false)
    UpdateNMSpawnPoint(nqId)
    GetMobByID(nqId):setRespawnTime(math.random(75600, 86400))
end

return entity
