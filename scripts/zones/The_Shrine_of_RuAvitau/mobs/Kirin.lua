-----------------------------------
-- Area: The Shrine of Ru'Avitau
--   NM: Kirin
-----------------------------------
local ID = zones[invaderXim.zone.THE_SHRINE_OF_RUAVITAU]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.WIND_MEVA, -64) -- Todo: Move to mob_resists.sql
    mob:setMod(invaderXim.mod.SILENCE_MEVA, 35)
    mob:setMod(invaderXim.mod.STUN_MEVA, 35)
    mob:setMod(invaderXim.mod.BIND_MEVA, 35)
    mob:setMod(invaderXim.mod.GRAVITY_MEVA, 35)
    mob:addStatusEffect(invaderXim.effect.REGEN, 50, 3, 0)
    mob:setLocalVar('numAdds', 1)
end

entity.onMobFight = function(mob, target)
    -- spawn gods
    local numAdds = mob:getLocalVar('numAdds')
    if mob:getBattleTime() / 180 == numAdds then
        local godsRemaining = {}
        for i = 1, 4 do
            if mob:getLocalVar('add'..i) == 0 then
                table.insert(godsRemaining, i)
            end
        end

        if #godsRemaining > 0 then
            local g   = godsRemaining[math.random(1, #godsRemaining)]
            local god = SpawnMob(ID.mob.KIRIN + g)

            if god then
                god:updateEnmity(target)
                god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos())
                mob:setLocalVar('add'..g, 1)
                mob:setLocalVar('numAdds', numAdds + 1)
            end
        end
    end

    -- ensure all spawned pets are doing stuff
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        local god = GetMobByID(i)
        if god and god:getCurrentAction() == invaderXim.act.ROAMING then
            god:updateEnmity(target)
        end
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENSTONE)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.KIRIN_CAPTIVATOR)
    player:showText(mob, ID.text.KIRIN_OFFSET + 1)
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end

entity.onMobDespawn = function(mob)
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end

return entity
