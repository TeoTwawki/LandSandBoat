-----------------------------------
-- Area: Bibiki Bay
--   NM: Dalham
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:addMod(invaderXim.mod.SLEEP_MEVA, 90)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.TERROR)
    mob:setMod(invaderXim.mod.WATER_ABSORB, 100)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENWATER, { chance = 100 })
end

entity.onMobFight = function(mob, target)
    local mobHPP = mob:getHPP()
    local multihitControl = mob:getLocalVar('multihitControl')

    if mobHPP < 75 and multihitControl == 0 then
        mob:setLocalVar('multihitControl', 1)
        -- set DOUBLE_ATTACK to 100
        -- cannot use MULTI_HIT because that is just upto X hits
        mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 100)
        -- inject packet for 2hr animation
        mob:injectActionPacket(mob:getID(), 11, 437, 0, 0x18, 0, 0, 626)
    elseif mobHPP < 50 and multihitControl == 1 then
        mob:setLocalVar('multihitControl', 2)
        -- set TRIPLE_ATTACK to 100
        mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 0)
        mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 100)
        -- inject packet for 2hr animation
        mob:injectActionPacket(mob:getID(), 11, 437, 0, 0x18, 0, 0, 626)
    elseif mobHPP < 25 and multihitControl == 2 then
        mob:setLocalVar('multihitControl', 3)
        -- set QUAD_ATTACK to 100
        mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 0)
        mob:setMod(invaderXim.mod.QUAD_ATTACK, 100)
        -- inject packet for 2hr animation
        mob:injectActionPacket(mob:getID(), 11, 437, 0, 0x18, 0, 0, 626)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
