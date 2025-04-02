-----------------------------------
-- The First Meeting
-----------------------------------
-- Log ID: 1, Quest ID: 52
-- Oggbi         : !pos -159 -7 5 236
-- Hide Flap (2) : !pos -124 3 -43 149
-----------------------------------
local davoiID = zones[invaderXim.zone.DAVOI]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_FIRST_MEETING)

quest.reward =
{
    fame     = 40,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.TEMPLE_GAITERS,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                not quest:getMustZone(player) and
                player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.GHOSTS_OF_THE_PAST) and
                player:getMainJob() == invaderXim.job.MNK and
                player:getMainLvl() >= invaderXim.settings.main.AF2_QUEST_LEVEL
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Oggbi'] = quest:progressEvent(233),

            onEventFinish =
            {
                [233] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.DAVOI] =
        {
            ['Hide_Flap_2'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL) then
                        if quest:getLocalVar(player, 'nmKilled') == 3 then
                            npcUtil.giveKeyItem(player, invaderXim.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL)
                        elseif
                            not GetMobByID(davoiID.mob.BILOPDOP):isSpawned() and
                            not GetMobByID(davoiID.mob.DELOKNOK):isSpawned()
                        then
                            SpawnMob(davoiID.mob.BILOPDOP):updateClaim(player)
                            SpawnMob(davoiID.mob.DELOKNOK):updateClaim(player)
                        end
                    end
                end,
            },

            ['Bilopdop'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if not player:hasKeyItem(invaderXim.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL) then
                        local nmStatus = quest:getLocalVar(player, 'nmKilled')

                        quest:setLocalVar(player, 'nmKilled', utils.mask.setBit(nmStatus, 0, true))
                    end
                end,
            },

            ['Deloknok'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if not player:hasKeyItem(invaderXim.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL) then
                        local nmStatus = quest:getLocalVar(player, 'nmKilled')

                        quest:setLocalVar(player, 'nmKilled', utils.mask.setBit(nmStatus, 1, true))
                    end
                end,
            },
        },

        [invaderXim.zone.FEIYIN] =
        {
            onZoneIn = function(player, prevZone)
                if
                    prevZone == invaderXim.zone.QUBIA_ARENA and
                    not player:hasKeyItem(invaderXim.ki.LETTER_FROM_DALZAKK)
                then
                    return 16
                end
            end,

            onEventFinish =
            {
                [16] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.LETTER_FROM_DALZAKK)
                end,
            },
        },

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Oggbi'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.LETTER_FROM_DALZAKK) and
                        player:hasKeyItem(invaderXim.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL)
                    then
                        return quest:progressEvent(234)
                    end
                end,
            },

            onEventFinish =
            {
                [234] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.LETTER_FROM_DALZAKK)
                        player:delKeyItem(invaderXim.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL)
                    end
                end,
            },
        },
    },
}

return quest
