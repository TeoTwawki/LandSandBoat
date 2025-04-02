-----------------------------------
-- Area: Monastic Cavern
--  Mob: Overlord Bakgodek
-- TODO: messages should be zone-wide
-----------------------------------
local ID = zones[invaderXim.zone.MONASTIC_CAVERN]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMod(invaderXim.mod.SLEEP_MEVA, 90)
    mob:setMod(invaderXim.mod.PARALYZE_MEVA, 75)
    mob:setMod(invaderXim.mod.SILENCE_MEVA, 75)
end

entity.onMobEngage = function(mob, target)
    mob:showText(mob, ID.text.ORC_KING_ENGAGE)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.TP_DRAIN, { chance = 35, power = math.random(95, 135) })
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.OVERLORD_OVERTHROWER)
    if optParams.isKiller then
        mob:showText(mob, ID.text.ORC_KING_DEATH)
    end
end

entity.onMobDespawn = function(mob)
    -- reset hqnm system back to the nm placeholder
    local nqId = mob:getID() - 1
    SetServerVariable('[POP]Overlord_Bakgodek', os.time() + 259200) -- 3 days
    SetServerVariable('[PH]Overlord_Bakgodek', 0)
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(nqId, false)
    UpdateNMSpawnPoint(nqId)
    GetMobByID(nqId):setRespawnTime(math.random(75600, 86400))
end

return entity
