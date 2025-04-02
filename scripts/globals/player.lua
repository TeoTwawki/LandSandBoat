require('scripts/globals/abyssea')
require('scripts/globals/gear_sets')
require('scripts/globals/quests')
require('scripts/globals/teleports')
require('scripts/events/login_campaign')
-----------------------------------
require('scripts/quests/full_speed_ahead')
-----------------------------------

local startingRaceInfo =
{
    [invaderXim.race.HUME_M  ] = { gear = { body = invaderXim.item.HUME_TUNIC,        hand = invaderXim.item.HUME_M_GLOVES,     leg = invaderXim.item.HUME_SLACKS,       feet = invaderXim.item.HUME_M_BOOTS       }, homeNation = invaderXim.nation.BASTOK   },
    [invaderXim.race.HUME_F  ] = { gear = { body = invaderXim.item.HUME_VEST,         hand = invaderXim.item.HUME_F_GLOVES,     leg = invaderXim.item.HUME_PANTS,        feet = invaderXim.item.HUME_F_BOOTS       }, homeNation = invaderXim.nation.BASTOK   },
    [invaderXim.race.ELVAAN_M] = { gear = { body = invaderXim.item.ELVAAN_JERKIN,     hand = invaderXim.item.ELVAAN_GLOVES,     leg = invaderXim.item.ELVAAN_M_CHAUSSES, feet = invaderXim.item.ELVAAN_M_LEDELSENS }, homeNation = invaderXim.nation.SANDORIA },
    [invaderXim.race.ELVAAN_F] = { gear = { body = invaderXim.item.ELVAAN_BODICE,     hand = invaderXim.item.ELVAAN_GAUNTLETS,  leg = invaderXim.item.ELVAAN_F_CHAUSSES, feet = invaderXim.item.ELVAAN_F_LEDELSENS }, homeNation = invaderXim.nation.SANDORIA },
    [invaderXim.race.TARU_M  ] = { gear = { body = invaderXim.item.TARUTARU_KAFTAN,   hand = invaderXim.item.TARUTARU_MITTS,    leg = invaderXim.item.TARUTARU_BRACCAE,  feet = invaderXim.item.TARUTARU_CLOMPS    }, homeNation = invaderXim.nation.WINDURST },
    [invaderXim.race.TARU_F  ] = { gear = { body = invaderXim.item.TARUTARU_KAFTAN,   hand = invaderXim.item.TARUTARU_MITTS,    leg = invaderXim.item.TARUTARU_BRACCAE,  feet = invaderXim.item.TARUTARU_CLOMPS    }, homeNation = invaderXim.nation.WINDURST },
    [invaderXim.race.MITHRA  ] = { gear = { body = invaderXim.item.MITHRAN_SEPARATES, hand = invaderXim.item.MITHRAN_GAUNTLETS, leg = invaderXim.item.MITHRAN_LOINCLOTH, feet = invaderXim.item.MITHRAN_GAITERS    }, homeNation = invaderXim.nation.WINDURST },
    [invaderXim.race.GALKA   ] = { gear = { body = invaderXim.item.GALKAN_SURCOAT,    hand = invaderXim.item.GALKAN_BRACERS,    leg = invaderXim.item.GALKAN_BRAGUETTE,  feet = invaderXim.item.GALKAN_SANDALS     }, homeNation = invaderXim.nation.BASTOK   },
}

local startingNationInfo =
{
    [invaderXim.nation.SANDORIA] = { ring = invaderXim.item.SAN_DORIAN_RING,  map = invaderXim.ki.MAP_OF_THE_SAN_DORIA_AREA },
    [invaderXim.nation.BASTOK  ] = { ring = invaderXim.item.BASTOKAN_RING,    map = invaderXim.ki.MAP_OF_THE_BASTOK_AREA    },
    [invaderXim.nation.WINDURST] = { ring = invaderXim.item.WINDURSTIAN_RING, map = invaderXim.ki.MAP_OF_THE_WINDURST_AREA  },
}

local startingJobGear =
{
    [invaderXim.job.WAR] = { invaderXim.item.ONION_SWORD                               },
    [invaderXim.job.MNK] = { invaderXim.item.WHITE_BELT                                },
    [invaderXim.job.WHM] = { invaderXim.item.ONION_ROD,    invaderXim.item.SCROLL_OF_CURE_EX  },
    [invaderXim.job.BLM] = { invaderXim.item.ONION_STAFF,  invaderXim.item.SCROLL_OF_STONE_EX },
    [invaderXim.job.RDM] = { invaderXim.item.ONION_DAGGER, invaderXim.item.SCROLL_OF_DIA_EX   },
    [invaderXim.job.THF] = { invaderXim.item.ONION_KNIFE                               },
}

-----------------------------------
-- public functions
-----------------------------------
xi = xi or {}
invaderXim.player = {}

invaderXim.player.charCreate = function(player)
    local race       = player:getRace()
    local raceInfo   = startingRaceInfo[race]
    local nation     = player:getNation()
    local nationInfo = startingNationInfo[nation]

    -- add race-specific starting gear
    for _, v in pairs(raceInfo.gear) do
        if not player:hasItem(v) then
            player:addItem(v)
            player:equipItem(v)
        end
    end

    -- add job-specific starting gear
    for _, v in pairs(startingJobGear[player:getMainJob()]) do
        if not player:hasItem(v) then
            player:addItem(v)
        end
    end

    -- add nation-specific map
    player:addKeyItem(nationInfo.map)

    -- add job-emote Key items
    player:addKeyItem(invaderXim.ki.JOB_GESTURE_WARRIOR)
    player:addKeyItem(invaderXim.ki.JOB_GESTURE_MONK)
    player:addKeyItem(invaderXim.ki.JOB_GESTURE_WHITE_MAGE)
    player:addKeyItem(invaderXim.ki.JOB_GESTURE_BLACK_MAGE)
    player:addKeyItem(invaderXim.ki.JOB_GESTURE_RED_MAGE)
    player:addKeyItem(invaderXim.ki.JOB_GESTURE_THIEF)

    -- add nation- and race-specific ring
    if nation == raceInfo.homeNation and not player:hasItem(nationInfo.ring) then
        player:addItem(nationInfo.ring)
    end

    -- unlock advanced jobs
    if invaderXim.settings.main.ADVANCED_JOB_LEVEL == 0 then
        for i = invaderXim.job.PLD, invaderXim.job.SCH do
            player:unlockJob(i)
        end
    end

    -- unlock subjob
    if invaderXim.settings.main.SUBJOB_QUEST_LEVEL == 0 then
        player:unlockJob(0)
    end

    -- give all maps
    if invaderXim.settings.main.ALL_MAPS == 1 then
        for i = invaderXim.ki.MAP_OF_THE_SAN_DORIA_AREA, invaderXim.ki.MAP_OF_DIO_ABDHALJS_GHEIXIMA do
            player:addKeyItem(i)
        end

        for i = invaderXim.ki.MAP_OF_AL_ZAHBI, invaderXim.ki.MAP_OF_RAKAZNAR do
            player:addKeyItem(i)
        end

        for i = invaderXim.ki.MAP_OF_RALA_WATERWAYS_U, invaderXim.ki.MAP_OF_RAKAZNAR_U do
            player:addKeyItem(i)
        end

        for i = invaderXim.ki.MAP_OF_ESCHA_ZITAH, invaderXim.ki.MAP_OF_REISENJIMA do
            player:addKeyItem(i)
        end
    end

    -- set initial level cap
    if invaderXim.settings.main.INITIAL_LEVEL_CAP ~= 50 then
        player:setLevelCap(invaderXim.settings.main.INITIAL_LEVEL_CAP)
    end

    -- increase starting inventory
    if invaderXim.settings.main.START_INVENTORY > 30 then
        player:changeContainerSize(invaderXim.inv.INVENTORY, invaderXim.settings.main.START_INVENTORY - 30)
        player:changeContainerSize(invaderXim.inv.MOGSATCHEL, invaderXim.settings.main.START_INVENTORY - 30)
    end

    --[[
        For some intermittent reason m_ZoneList ends up empty on characters, which is
        possibly also why they lose key items.  When that happens, CharCreate will be run and
        they end up losing their gil to the code below.  Added a conditional to hopefully
        prevent that until the bug is fixed.  Used the if instead of addGil to prevent abuse
        on servers with very high values of START_GIL, I guess.
    --]]

    if player:getGil() < invaderXim.settings.main.START_GIL then
        player:setGil(invaderXim.settings.main.START_GIL)
    end

    if invaderXim.settings.main.NEW_CHARACTER_CUTSCENE == 0 then -- Do things that would normally be done in opening cutscene.
        player:addItem(invaderXim.item.ADVENTURER_COUPON)
        player:setHomePoint()
    end

    player:addTitle(invaderXim.title.NEW_ADVENTURER)
    player:setCharVar('HQuest[moghouseExpo]notSeen', 1) -- needs Moghouse intro
    player:setCharVar('spokeKindlix', 1)                -- Kindlix introduction
    player:setCharVar('spokePyropox', 1)                -- Pyropox introduction
    player:setCharVar('TutorialProgress', 1)            -- Has not started tutorial
    player:setCharVar('EinherjarIntro', 1)              -- Has not seen Einherjar intro
    player:setNewPlayer(true)                           -- apply new player flag
end

-- called by core after a player logs into the server or zones
invaderXim.player.onGameIn = function(player, firstLogin, zoning)
    if not zoning then
        -- things checked ONLY during logon go here
        if firstLogin then
            invaderXim.player.charCreate(player)
        end
    else
        -- things checked ONLY during zone in go here
        if
            player:getLocalVar('gameLogin') == 1 and
            invaderXim.abyssea.isInAbysseaZone(player) and
            not player:hasStatusEffect(invaderXim.effect.VISITANT)
        then
            local zoneID = player:getZoneID()
            local ID = zones[zoneID]

            player:messageSpecial(ID.text.ABYSSEA_TIME_OFFSET + 8)
            player:setPos(unpack(invaderXim.abyssea.exitPositions[zoneID]))
        end
    end

    -- Abyssea starting quest should be flagged when expansion is active
    if
        invaderXim.settings.main.ENABLE_ABYSSEA == 1 and
        player:getQuestStatus(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.A_JOURNEY_BEGINS) == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:addQuest(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.A_JOURNEY_BEGINS)
    end

    -- This is for migration safety only, and should be removed at a later date
    if
        player:hasCompletedQuest(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.A_JOURNEY_BEGINS) and
        player:getTraverserEpoch() == 0
    then
        player:setTraverserEpoch()
    end

    -- apply mods from gearsets (scripts/globals/gear_sets.lua)
    invaderXim.gear_sets.checkForGearSet(player)

    -- god mode
    if player:getCharVar('GodMode') == 1 then
        player:addStatusEffect(invaderXim.effect.MAX_HP_BOOST, 1000, 0, 0)
        player:addStatusEffect(invaderXim.effect.MAX_MP_BOOST, 1000, 0, 0)
        player:addStatusEffect(invaderXim.effect.MIGHTY_STRIKES, 1, 0, 0)
        player:addStatusEffect(invaderXim.effect.HUNDRED_FISTS, 1, 0, 0)
        player:addStatusEffect(invaderXim.effect.CHAINSPELL, 1, 0, 0)
        player:addStatusEffect(invaderXim.effect.PERFECT_DODGE, 1, 0, 0)
        player:addStatusEffect(invaderXim.effect.INVINCIBLE, 1, 0, 0)
        player:addStatusEffect(invaderXim.effect.ELEMENTAL_SFORZO, 1, 0, 0)
        player:addStatusEffect(invaderXim.effect.MANAFONT, 1, 0, 0)
        player:addStatusEffect(invaderXim.effect.REGAIN, 300, 0, 0)
        player:addStatusEffect(invaderXim.effect.REFRESH, 99, 0, 0)
        player:addStatusEffect(invaderXim.effect.REGEN, 99, 0, 0)
        player:addMod(invaderXim.mod.RACC, 2500)
        player:addMod(invaderXim.mod.RATT, 2500)
        player:addMod(invaderXim.mod.ACC, 2500)
        player:addMod(invaderXim.mod.ATT, 2500)
        player:addMod(invaderXim.mod.MATT, 2500)
        player:addMod(invaderXim.mod.MACC, 2500)
        player:addMod(invaderXim.mod.RDEF, 2500)
        player:addMod(invaderXim.mod.DEF, 2500)
        player:addMod(invaderXim.mod.MDEF, 2500)
        player:addHP(50000)
        player:setMP(50000)
    end

    -- !immortal
    if player:getCharVar('Immortal') == 1 then
        player:setUnkillable(true)
    end

    -- !hide
    if player:getCharVar('GMHidden') == 1 then
        player:setGMHidden(true)
    end

    -- remember time player zoned in (e.g., to support zone-in delays)
    player:setLocalVar('ZoneInTime', os.time())
    player:setLocalVar('ZoningIn', 1)

    -- Slight delay to ensure player is fully logged in
    player:timer(2500, function(playerArg)
        player:setLocalVar('ZoningIn', 0)
        -- Login Campaign rewards points once daily
        invaderXim.events.loginCampaign.onGameIn(playerArg)
    end)

    -- Enforce that gameLogin is always set to 0 once this method exits
    -- This assists with ensuring Abyssea visitant status is handled properly on logins
    player:setLocalVar('gameLogin', 0)
end

invaderXim.player.onPlayerDeath = function(player)
end

invaderXim.player.onPlayerLevelUp = function(player)
end

invaderXim.player.onPlayerLevelDown = function(player)
end

invaderXim.player.onPlayerMount = function(player)
    -- For PM3-3 The Road Forks.  This value will be checked periodically, and break
    -- the Mimeo Jewel should a player be mounted, zone, or disconnect.
    if
        player:getZoneID() == invaderXim.zone.ATTOHWA_CHASM and
        player:hasKeyItem(invaderXim.ki.MIMEO_JEWEL)
    then
        player:messageSpecial(zones[invaderXim.zone.ATTOHWA_CHASM].text.MIMEO_JEWEL_OFFSET + 4, invaderXim.ki.MIMEO_JEWEL)
        player:delKeyItem(invaderXim.ki.MIMEO_JEWEL)
    end
end

invaderXim.player.onPlayerEmote = function(player, emoteId)
    if
        emoteId == invaderXim.emote.CHEER and
        player:hasStatusEffect(invaderXim.effect.FULL_SPEED_AHEAD)
    then
        invaderXim.fsa.onCheer(player)
    end
end

invaderXim.player.onPlayerVolunteer = function(player, text)
end

return invaderXim.player
