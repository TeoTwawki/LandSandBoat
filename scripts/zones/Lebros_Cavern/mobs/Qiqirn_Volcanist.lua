-----------------------------------
-- Area: Lebros Cavern (Excavation Duty)
--  Mob: Qiqirn Volcanist
-----------------------------------
local ID = zones[invaderXim.zone.LEBROS_CAVERN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.assault.adjustMobLevel(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    if mob:getLocalVar('dead') == 0 then
        mob:setLocalVar('dead', 1)
        if math.random(0, 100) >= 50 then
            player:addTempItem(invaderXim.item.QIQIRN_MINE)
            player:messageSpecial(ID.text.TEMP_ITEM, invaderXim.item.QIQIRN_MINE)
        end
    end
end

entity.onMobDespawn = function(mob)
end

return entity
