-----------------------------------
-- PET: Luopan
-----------------------------------
xi = xi or {}
invaderXim.pets = invaderXim.pets or {}
invaderXim.pets.luopan = {}

invaderXim.pets.luopan.onMobSpawn = function(mob)
    -- BGWIKI: "Regardless of perpetuation cost reduction, Luopans have a maximum duration of 10 minutes."
    mob:timer(600000, function(mobArg)
        mobArg:setHP(0)
    end)
end

invaderXim.pets.luopan.onMobDeath = function(mob)
end
