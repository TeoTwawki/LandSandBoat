-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  Mob: Myxomycete
-- Note: PH for Noble Mold
-----------------------------------
local ID = zones[invaderXim.zone.THE_SANCTUARY_OF_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

local nobleMoldPHTable =
{
    [ID.mob.NOBLE_MOLD - 2] = ID.mob.NOBLE_MOLD, -- -391.184 -0.269 -159.086
    [ID.mob.NOBLE_MOLD - 1] = ID.mob.NOBLE_MOLD, -- -378.456 0.425 -162.489
}

entity.onMobRoam = function(mob)
    local weather = mob:getWeather()

    if weather == invaderXim.weather.RAIN or weather == invaderXim.weather.SQUALL then
        local params = {}
        params.immediate = true
        if invaderXim.mob.phOnDespawn(mob, nobleMoldPHTable, 100, math.random(43200, 57600), params) then -- 12 to 16 hours
            local p = mob:getPos()
            GetMobByID(ID.mob.NOBLE_MOLD):setSpawn(p.x, p.y, p.z, p.rot)
            DespawnMob(mob:getID())
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 115, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 116, 2, invaderXim.regime.type.FIELDS)
end

return entity
