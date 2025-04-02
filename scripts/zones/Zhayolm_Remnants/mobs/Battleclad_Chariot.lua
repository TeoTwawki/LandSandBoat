-----------------------------------
-- Area: Zhayolm Remnants
--   NM: Battleclad Chariot
-----------------------------------
mixins = { require('scripts/mixins/families/chariot') }
-----------------------------------

---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addMod(invaderXim.mod.DMGPHYS, -2500)
    mob:addMod(invaderXim.mod.DMGRANGE, -2500)
    mob:addMod(invaderXim.mod.DEF, 50)
    mob:addMod(invaderXim.mod.ATT, 150)
    mob:addMod(invaderXim.mod.MAIN_DMG_RATING, 45)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.ROAM_DISTANCE, 0)
    mob:setMobMod(invaderXim.mobMod.ROAM_TURNS, 0)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.STAR_CHARIOTEER)
    if optParams.isKiller or optParams.noKiller then
        mob:getInstance():complete()
    end
end

return entity
