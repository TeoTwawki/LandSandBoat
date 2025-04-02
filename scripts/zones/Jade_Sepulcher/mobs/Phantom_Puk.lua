-----------------------------------
-- Area: Jade Sepulcher
--   NM: Phantom Puk
-----------------------------------
mixins = { require('scripts/mixins/families/puk') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.REQUIEM)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.PETRIFY)
end

entity.onMobEngage = function(mob, target)
    mob:setLocalVar('boreas_mantle', os.time() + math.random(15, 45))
end

entity.onMobFight = function(mob, target)
    local now = os.time()
    if mob:getLocalVar('boreas_mantle') <= now then
        mob:useMobAbility(invaderXim.mobSkill.BOREAS_MANTLE, mob)
        mob:setLocalVar('boreas_mantle', now + math.random(60, 90))
    end
end

entity.onMobDeath = function(mob, player, optParams)
    local mobID = mob:getID()
    for cloneID = mobID + 1, mobID + 4 do
        local clone = GetMobByID(cloneID)
        if clone then
            local action = clone:getCurrentAction()
            if action ~= invaderXim.act.NONE and action ~= invaderXim.act.DEATH then
                DespawnMob(cloneID)
            end
        end
    end
end

return entity
