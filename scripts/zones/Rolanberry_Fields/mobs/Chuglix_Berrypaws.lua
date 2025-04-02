-----------------------------------
-- Area: Rolanberry Fields
--   NM: Chuglix Berrypaws
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    if
        not player:hasKeyItem(invaderXim.ki.SEEDSPALL_CAERULUM) and
        not player:hasKeyItem(invaderXim.ki.VIRIDIAN_KEY)
    then
        npcUtil.giveKeyItem(player, invaderXim.ki.SEEDSPALL_CAERULUM)
    end
end

return entity
