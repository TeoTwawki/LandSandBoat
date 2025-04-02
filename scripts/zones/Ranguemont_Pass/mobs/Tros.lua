-----------------------------------
-- Area: Ranguemont Pass
--   NM: Tros
-- Used in Quests: Painful Memory
-- !pos -289 -45 212 166
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    if player:hasKeyItem(invaderXim.ki.MERTAIRES_BRACELET) then
        player:setCharVar('TrosKilled', 1)
        player:setCharVar('Tros_Timer', os.time())
    end
end

return entity
