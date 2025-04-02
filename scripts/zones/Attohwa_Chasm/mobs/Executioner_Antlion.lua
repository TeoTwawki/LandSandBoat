-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Executioner Antlion
-----------------------------------
local ID = zones[invaderXim.zone.ATTOHWA_CHASM]
mixins = { require('scripts/mixins/families/antlion_ambush_noaggro') }
local attohwaChasmGlobal = require('scripts/zones/Attohwa_Chasm/globals')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 120)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    if attohwaChasmGlobal.canStartFeelerQMTimer() then
        GetNPCByID(ID.npc.QM_FEELER_ANTLION):updateNPCHideTime(invaderXim.settings.main.FORCE_SPAWN_QM_RESET_TIME)
    end
end

return entity
