-----------------------------------
-- Area: Konschtat Highlands
--   NM: Ghillie Dhu
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    -- For its TP drain melee.
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)

    -- Hits especially hard for his level, even by NM standards.
    mob:addMod(invaderXim.mod.ATT, 50) -- May need adjustment along with cmbDmgMult in mob_pools.sql
end

entity.onMobRoam = function(mob)
    -- Fairly sure he shouldn't be storing up max TP while idle.
    if mob:getMod(invaderXim.mod.REGAIN) ~= 0 then
        mob:setMod(invaderXim.mod.REGAIN, 0)
    end
end

entity.onMobFight = function(mob, target)
    -- Guesstimating the regain scales from 1-100,
    -- nobody has the excact values but it scales with HP.
    local tp = (100 - mob:getHPP()) * 0.5
    if mob:getMod(invaderXim.mod.REGAIN) ~= utils.clamp(tp, 1, 100) then
        mob:setMod(invaderXim.mod.REGAIN, utils.clamp(tp, 1, 100))
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.TP_DRAIN, { power = math.random(10, 30) })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 204)
    -- I think he still counts for the FoV page? Most NM's do not though.
    invaderXim.regime.checkRegime(player, mob, 81, 1, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 4200)) -- 60~70 min repop.
end

return entity
