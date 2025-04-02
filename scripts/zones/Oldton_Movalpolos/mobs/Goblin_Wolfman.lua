-----------------------------------
-- Area: Oldton Movalpolos
--   NM: Goblin Wolfman
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
    mob:addMod(invaderXim.mod.ACC, 70) -- Very accurate
    mob:setLocalVar('weaponOn', 0)
end

entity.onMobFight = function(mob, target)
    local weaponOn = mob:getLocalVar('weaponOn')
    if mob:hasStatusEffect(invaderXim.effect.BLOOD_WEAPON) and weaponOn == 0 then
        mob:addMod(invaderXim.mod.DELAY, 1500)
        mob:addMod(invaderXim.mod.ATTP, 160)
        mob:setLocalVar('weaponOn', 1)
    elseif not mob:hasStatusEffect(invaderXim.effect.BLOOD_WEAPON) and weaponOn == 1 then
        mob:delMod(invaderXim.mod.DELAY, 1500)
        mob:delMod(invaderXim.mod.ATTP, 160)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 245)
end

return entity
