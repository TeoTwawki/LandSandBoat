-----------------------------------
-- Area: Ceizak Battlegrounds
-- NM: Transcendent Scorpion
-- !pos 160 0 -400 261
-- !additem 6013
-----------------------------------
---@type TMobEntity
local entity = {}

local removables = {
    invaderXim.effect.FLASH, invaderXim.effect.BLINDNESS, invaderXim.effect.ELEGY, invaderXim.effect.REQUIEM,
    invaderXim.effect.PARALYSIS, invaderXim.effect.POISON, invaderXim.effect.DISEASE, invaderXim.effect.PLAGUE,
    invaderXim.effect.WEIGHT, invaderXim.effect.BIND, invaderXim.effect.BIO, invaderXim.effect.DIA, invaderXim.effect.BURN,
    invaderXim.effect.FROST, invaderXim.effect.CHOKE, invaderXim.effect.RASP, invaderXim.effect.SHOCK, invaderXim.effect.DROWN,
    invaderXim.effect.STR_DOWN, invaderXim.effect.DEX_DOWN, invaderXim.effect.VIT_DOWN, invaderXim.effect.AGI_DOWN,
    invaderXim.effect.INT_DOWN, invaderXim.effect.MND_DOWN, invaderXim.effect.CHR_DOWN, invaderXim.effect.ADDLE, invaderXim.effect.SLOW,
    invaderXim.effect.HELIX, invaderXim.effect.ACCURACY_DOWN, invaderXim.effect.ATTACK_DOWN, invaderXim.effect.EVASION_DOWN,
    invaderXim.effect.DEFENSE_DOWN, invaderXim.effect.MAGIC_ACC_DOWN, invaderXim.effect.MAGIC_ATK_DOWN,
    invaderXim.effect.MAGIC_EVASION_DOWN, invaderXim.effect.MAGIC_DEF_DOWN, invaderXim.effect.MAX_TP_DOWN,
    invaderXim.effect.MAX_MP_DOWN, invaderXim.effect.MAX_HP_DOWN
}

local function removeSpecificDebuffs(mob)
    local numEffectsRemoved = 0
    for _, effect in ipairs(removables) do
        if mob:delStatusEffect(effect) then  -- More efficient
            numEffectsRemoved = numEffectsRemoved + 1
        end
    end

    return numEffectsRemoved
end

entity.onMobFight = function(mob, target)
    if mob:getHPP() <= 50 then
        mob:setMobMod(invaderXim.mobMod.SKILL_LIST, 2021)
    else
        mob:setMobMod(invaderXim.mobMod.SKILL_LIST, 2020)
    end
end

entity.onMobSpawn = function(mob)
    mob:addListener('WEAPONSKILL_USE', 'ALL_MOBSKILL_CHECK', function(mobArg, target, skillID, tp, action)
        local effectsRemoved = removeSpecificDebuffs(mob)
        if effectsRemoved > 0 then
            for _, hateEntity in ipairs(mob:getEnmityList()) do
                local player = hateEntity.entity
                if player and player:isPC() then
                    player:messageSpecial(zones[invaderXim.zone.CEIZAK_BATTLEGROUNDS].text.SPRING_STEP)
                    break  -- Only send message once
                end
            end
        end
    end)
end

entity.onMobDeath = function(mob)
end

return entity
