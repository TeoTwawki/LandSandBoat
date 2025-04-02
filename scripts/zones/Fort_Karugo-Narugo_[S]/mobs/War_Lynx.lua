-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  Mob: War Lynx
-- The Tigress Strikes Fight
-----------------------------------
local ID = zones[invaderXim.zone.FORT_KARUGO_NARUGO_S]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDeath = function(mob, player, optParams)
    if
        mob:getID() == ID.mob.TIGRESS_STRIKES_WAR_LYNX and
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_TIGRESS_STRIKES) == invaderXim.questStatus.QUEST_ACCEPTED
    then
        player:setCharVar('WarLynxKilled', 1)
    end
end

return entity
