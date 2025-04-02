-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Nasus
-----------------------------------
local ID = zones[invaderXim.zone.YUHTUNGA_JUNGLE]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    local qm = GetNPCByID(ID.npc.TUNING_OUT_QM)

    if qm then
        qm:setLocalVar('NasusKilled', qm:getLocalVar('NasusKilled') + 1)
    end
end

return entity
