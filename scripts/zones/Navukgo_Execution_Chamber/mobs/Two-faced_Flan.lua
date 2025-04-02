-----------------------------------
-- Area: Navukgo Execution Chamber
--   NM: Two-faced Flan
-----------------------------------
---@type TMobEntity
local entity = {}

local function smooth(mob)
    mob:setAnimationSub(1)
    mob:setMagicCastingEnabled(true)
    mob:setMod(invaderXim.mod.DMGPHYS, -3300)
    mob:setMod(invaderXim.mod.DMGMAGIC, 0)
    mob:setMod(invaderXim.mod.REGAIN, 0)
    mob:setLocalVar('spikesTime', os.time() + math.random(45, 60))
end

local function spikes(mob)
    mob:setAnimationSub(2)
    mob:setMagicCastingEnabled(false)
    mob:setMod(invaderXim.mod.DMGMAGIC, -3300)
    mob:setMod(invaderXim.mod.DMGPHYS, 0)
    mob:setMod(invaderXim.mod.REGAIN, 300)
end

entity.onMobInitialize = function(mob)
    mob:addListener('TAKE_DAMAGE', 'TAKE_DAMAGE_FLAN', function(mobArg, damage, attacker, attackType, damageType)
        if
            mob:getAnimationSub() == 1 and
            (attackType == invaderXim.attackType.PHYSICAL or attackType == invaderXim.attackType.RANGED) and
            os.time() >= mobArg:getLocalVar('spikesTime')
        then
            spikes(mobArg)
        end
    end)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.REFRESH, 100)
    mob:setMod(invaderXim.mod.SILENCERES, 50)
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 5)
    mob:setMobMod(invaderXim.mobMod.STANDBACK_COOL, 0)
    smooth(mob)
end

entity.onMobWeaponSkill = function(target, mob, skill)
    if skill:getID() == invaderXim.mobSkill.XENOGLOSSIA then
        smooth(mob)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
