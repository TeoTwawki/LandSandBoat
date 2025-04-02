-----------------------------------
-- Area: Attohwa Chasm
--   NM: Alastor Antlion
-----------------------------------
local ID = zones[invaderXim.zone.ATTOHWA_CHASM]
mixins = { require('scripts/mixins/families/antlion_ambush_noaggro') }
local attohwaChasmGlobal = require('scripts/zones/Attohwa_Chasm/globals')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.GA_CHANCE, 50)
    mob:setMobMod(invaderXim.mobMod.MUG_GIL, 10000)
    mob:addMod(invaderXim.mod.FASTCAST, 10)
    mob:addMod(invaderXim.mod.BIND_MEVA, 40)
    mob:addMod(invaderXim.mod.SILENCE_MEVA, 40)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PETRIFY)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    if attohwaChasmGlobal.canStartFeelerQMTimer() then
        GetNPCByID(ID.npc.QM_FEELER_ANTLION):updateNPCHideTime(invaderXim.settings.main.FORCE_SPAWN_QM_RESET_TIME)
    end
end

return entity
