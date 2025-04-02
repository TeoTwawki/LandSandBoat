-----------------------------------
-- Area: Grauberg [S]
--   NM: Vasiliceratops
-- https://www.bg-wiki.com/ffxi/Vasiliceratops
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.PETRIFY)

    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 100)
    mob:setBaseSpeed(100)
end

entity.onMobWeaponSkillPrepare = function(mob, target)
    return 2099 -- Batterhorn is only TP move
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 505)
end

return entity
