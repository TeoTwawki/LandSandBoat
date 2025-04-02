-----------------------------------
-- Red Mage Job Utilities
-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.red_mage = invaderXim.job_utils.red_mage or {}

-----------------------------------
-- Ability Check Functions
-----------------------------------
invaderXim.job_utils.red_mage.checkChainspell = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

invaderXim.job_utils.red_mage.checkStymie = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
invaderXim.job_utils.red_mage.useChainspell = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.CHAINSPELL, 1, 0, 60)
end

invaderXim.job_utils.red_mage.useComposure = function(player, target, ability)
    player:delStatusEffect(invaderXim.effect.COMPOSURE)
    player:addStatusEffect(invaderXim.effect.COMPOSURE, 1, 0, 7200)
end

invaderXim.job_utils.red_mage.useConvert = function(player, target, ability)
    local playerMP    = player:getMP()
    local playerHP    = player:getHP()
    local playerMaxHP = player:getMaxHP()

    -- HP bonuses
    local jpExtraHP       = math.floor(playerMaxHP * player:getJobPointLevel(invaderXim.jp.CONVERT_EFFECT) / 100)
    local murgleisExtraHP = 0

    if player:getMod(invaderXim.mod.AUGMENTS_CONVERT) > 0 then
        murgleisExtraHP = math.floor(playerMaxHP * player:getMod(invaderXim.mod.AUGMENTS_CONVERT) / 100)
    end

    if playerMP > 0 then -- Safety check, not really needed.
        player:setHP(playerMP + jpExtraHP + murgleisExtraHP)
        player:setMP(playerHP)
    end
end

invaderXim.job_utils.red_mage.useSaboteur = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.SABOTEUR, 1, 0, 60)
end

invaderXim.job_utils.red_mage.useSpontaneity = function(player, target, ability)
    target:addStatusEffect(invaderXim.effect.SPONTANEITY, 1, 0, 60)
end

invaderXim.job_utils.red_mage.useStymie = function(player, target, ability)
    target:addStatusEffect(invaderXim.effect.STYMIE, 1, 0, 60)
end
