require('scripts/globals/mixins')

g_mixins = g_mixins or {}

g_mixins.maat = function(maatMob)
    maatMob:addListener('SPAWN', 'JOB_SPECIAL_SPAWN', function(mob)
        if mob:getMainJob() == invaderXim.job.NIN then
            mob:setLocalVar('specialThreshold', 40)
        elseif mob:getMainJob() == invaderXim.job.DRG then
            mob:setLocalVar('specialThreshold', 75)
        else
            mob:setLocalVar('specialThreshold', math.random(50, 60))
        end
    end)

    maatMob:addListener('ROAM_TICK', 'MAAT_RTICK', function(mob)
        if mob:getLocalVar('engaged') == 0 then
            local players = mob:getZone():getPlayers()
            for _, player in pairs(players) do
                if player:checkDistance(mob) < 8 then
                    local ID = zones[mob:getZoneID()]
                    mob:messageText(mob, ID.text.YOU_DECIDED_TO_SHOW_UP)
                    mob:setLocalVar('engaged', player:getID())
                end
            end
        end
    end)

    maatMob:addListener('ENGAGE', 'MAAT_ENGAGE', function(mob, target)
        if mob:getLocalVar('engaged') == 0 then
            local ID = zones[mob:getZoneID()]
            mob:messageText(mob, ID.text.YOU_DECIDED_TO_SHOW_UP)
            mob:setLocalVar('engaged', target:getID())
        end
    end)

    maatMob:addListener('DISENGAGE', 'MAAT_DISENGAGE', function(mob)
        local engagedID = mob:getLocalVar('engaged')
        if engagedID ~= 0 then
            local player = GetPlayerByID(engagedID)
            if player and player:getHP() == 0 then
                local ID = zones[mob:getZoneID()]
                mob:showText(mob, ID.text.LOOKS_LIKE_YOU_WERENT_READY)
            end
        end
    end)

    maatMob:addListener('COMBAT_TICK', 'MAAT_CTICK', function(mob)
        local defaultAbility =
        {
            [invaderXim.job.WAR] = invaderXim.jsa.MIGHTY_STRIKES_MAAT,
            [invaderXim.job.MNK] = invaderXim.jsa.HUNDRED_FISTS_MAAT,
            [invaderXim.job.WHM] = invaderXim.jsa.BENEDICTION_MAAT,
            [invaderXim.job.BLM] = invaderXim.jsa.MANAFONT_MAAT,
            [invaderXim.job.RDM] = invaderXim.jsa.CHAINSPELL_MAAT,
            [invaderXim.job.THF] = invaderXim.jsa.PERFECT_DODGE_MAAT,
            [invaderXim.job.PLD] = invaderXim.jsa.INVINCIBLE_MAAT,
            [invaderXim.job.DRK] = invaderXim.jsa.BLOOD_WEAPON_MAAT,
            [invaderXim.job.BST] = invaderXim.jsa.FAMILIAR_MAAT,
            [invaderXim.job.BRD] = invaderXim.jsa.SOUL_VOICE_MAAT,
            [invaderXim.job.RNG] = invaderXim.jsa.EES_MAAT,
            [invaderXim.job.SAM] = invaderXim.jsa.MEIKYO_SHISUI_MAAT,
            [invaderXim.job.NIN] = invaderXim.jsa.MIJIN_GAKURE_MAAT,
            [invaderXim.job.DRG] = invaderXim.jsa.CALL_WYVERN_MAAT,
            [invaderXim.job.SMN] = invaderXim.jsa.ASTRAL_FLOW_MAAT,
        }

        if mob:getHPP() < mob:getLocalVar('specialThreshold') then
            local ID = zones[mob:getZoneID()]
            mob:messageText(mob, ID.text.NOW_THAT_IM_WARMED_UP)
            mob:useMobAbility(defaultAbility[mob:getMainJob()])
            mob:setLocalVar('specialThreshold', 0)
        end

        if
            mob:getHPP() < 20 or
            (mob:getMainJob() == invaderXim.job.WHM and mob:getBattleTime() > 300)
        then
            local ID = zones[mob:getZoneID()]
            mob:showText(mob, ID.text.YOUVE_COME_A_LONG_WAY)
            mob:getBattlefield():win()
        end
    end)

    maatMob:addListener('ITEM_STOLEN', 'MAAT_ITEM_STOLEN', function(mob, player, itemId)
        if mob:getMainJob() == invaderXim.job.THF then
            local ID = zones[mob:getZoneID()]
            mob:messageText(mob, ID.text.YOUVE_COME_A_LONG_WAY)
            mob:getBattlefield():win()
        end
    end)

    maatMob:addListener('DEATH', 'MAAT_DEATH', function(mob, killer)
        local ID = zones[mob:getZoneID()]
        mob:messageText(mob, ID.text.YOUVE_COME_A_LONG_WAY)
    end)

    maatMob:addListener('WEAPONSKILL_TAKE', 'MAAT_WEAPONSKILL_TAKE', function(target, user, wsid, tp, action)
        local ID = zones[target:getZoneID()]
        target:messageText(target, ID.text.THAT_LL_HURT_IN_THE_MORNING)
    end)

    maatMob:addListener('WEAPONSKILL_USE', 'MAAT_WEAPONSKILL_USE', function(mob, target, wsid, tp, action)
        local ID = zones[mob:getZoneID()]
        if wsid == 1028 then -- Tackle
            mob:messageText(mob, ID.text.TAKE_THAT_YOU_WHIPPERSNAPPER)
        elseif wsid == 1033 then -- Dragon Kick
            mob:messageText(mob, ID.text.TEACH_YOU_TO_RESPECT_ELDERS)
        elseif wsid == 1034 then -- Asuran Fists
            mob:messageText(mob, ID.text.LOOKS_LIKE_YOU_WERENT_READY)
        end
    end)
end

return g_mixins.maat
