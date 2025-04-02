-----------------------------------
-- Area: Talacca Cove
--  Mob: Angler Orobon
-----------------------------------
mixins = { require('scripts/mixins/families/orobon') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.DETECTION, bit.bor(invaderXim.detects.SIGHT, invaderXim.detects.HEARING))
    mob:setMobMod(invaderXim.mobMod.SIGHT_RANGE, 25)
    mob:setMobMod(invaderXim.mobMod.NO_DROPS, 1)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
end

entity.onMobWeaponSkill = function(target, mob, skill)
    if skill:getID() == invaderXim.mobSkill.HYPNIC_LAMP then
        mob:useMobAbility(invaderXim.mobSkill.DEATHGNASH)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
