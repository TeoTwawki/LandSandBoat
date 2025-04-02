-----------------------------------
-- Area: Batallia Downs
--  Mob: Vegnix Greenthumb
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    if
        not player:hasKeyItem(invaderXim.ki.SEEDSPALL_ROSEUM) and
        not player:hasKeyItem(invaderXim.ki.VIRIDIAN_KEY)
    then
        npcUtil.giveKeyItem(player, invaderXim.ki.SEEDSPALL_ROSEUM)
    end
end

return entity
