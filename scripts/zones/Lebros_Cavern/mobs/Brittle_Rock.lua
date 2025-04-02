-----------------------------------
-- Area: Lebros Cavern (Excavation Duty)
--  Mob: Brittle Rock
-- Immune to sleep (light, dark), poison, cannot regain HP on deaggro
-----------------------------------
local ID = zones[invaderXim.zone.LEBROS_CAVERN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.assault.adjustMobLevel(mob)
    mob:setMobMod(invaderXim.mobMod.NO_REST, 0)
    mob:setMobMod(invaderXim.mobMod.EXP_BONUS, -100)
    mob:setMobMod(invaderXim.mobMod.NO_MOVE, 1)
    mob:setAutoAttackEnabled(false)
    mob:setMod(invaderXim.mod.UDMGPHYS, -9000)
    mob:setMod(invaderXim.mod.UDMGBREATH, -9000)
    mob:setMod(invaderXim.mod.UDMGRANGE, -9000)
    mob:setMod(invaderXim.mod.UDMGMAGIC, -9000)
    mob:setMod(invaderXim.mod.CURSE_MEVA, 9999)
    mob:setMod(invaderXim.mod.EVA, 0)
    mob:setMobMod(invaderXim.mobMod.NO_DROPS, 1)
    mob:addListener('WEAPONSKILL_TAKE', 'BRITTLE_ROCK_WEAPONSKILL_TAKE', function(mobArg, user, wsid)
        if wsid == 1838 then
            mobArg:setHP(0)
        end
    end)
end

entity.onMobDeath = function(mob, player, optParams)
    if mob:getLocalVar('dead') == 0 then
        mob:setLocalVar('dead', 1)
        local mobID    = mob:getID()
        local instance = mob:getInstance()
        if not instance then
            return
        end

        if mobID == ID.mob[invaderXim.assault.mission.EXCAVATION_DUTY].MOBS_START.BRITTLE_ROCK1 then
            GetNPCByID(ID.npc._1rx, instance):setAnimation(invaderXim.animation.OPEN_DOOR)
        elseif mobID == ID.mob[invaderXim.assault.mission.EXCAVATION_DUTY].MOBS_START.BRITTLE_ROCK2 then
            GetNPCByID(ID.npc._1ry, instance):setAnimation(invaderXim.animation.OPEN_DOOR)
        elseif mobID == ID.mob[invaderXim.assault.mission.EXCAVATION_DUTY].MOBS_START.BRITTLE_ROCK3 then
            GetNPCByID(ID.npc._1rz, instance):setAnimation(invaderXim.animation.OPEN_DOOR)
        elseif mobID == ID.mob[invaderXim.assault.mission.EXCAVATION_DUTY].MOBS_START.BRITTLE_ROCK4 then
            GetNPCByID(ID.npc._jr0, instance):setAnimation(invaderXim.animation.OPEN_DOOR)
        elseif mobID == ID.mob[invaderXim.assault.mission.EXCAVATION_DUTY].MOBS_START.BRITTLE_ROCK5 then
            GetNPCByID(ID.npc._jr1, instance):setAnimation(invaderXim.animation.OPEN_DOOR)
        end

        instance:setProgress(instance:getProgress() + 1)
    end
end

return entity
