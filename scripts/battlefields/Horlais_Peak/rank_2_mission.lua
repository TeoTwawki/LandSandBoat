-----------------------------------
-- Rank 2 Final Mission
-- Horlais Peak mission battlefield
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId = invaderXim.battlefield.id.RANK_2_MISSION_1,
    canLoseExp    = false,
    isMission     = true,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 25,
    timeLimit     = utils.minutes(30),
    index         = 0,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    local isCurrentMission    = player:getCurrentMission(invaderXim.mission.log_id.WINDURST) == invaderXim.mission.id.windurst.THE_THREE_KINGDOMS_SANDORIA2 or
        player:getCurrentMission(invaderXim.mission.log_id.BASTOK) == invaderXim.mission.id.bastok.THE_EMISSARY_SANDORIA2
    local currentRequirements = isCurrentMission
    local nonRegistrantReqs   = player:hasCompletedMission(player:getNation(), 5) or currentRequirements

    return (not isRegistrant and nonRegistrantReqs) or currentRequirements
end

function content:checkSkipCutscene(player)
    return player:hasCompletedMission(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.THE_THREE_KINGDOMS_SANDORIA2) or
        player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.THE_EMISSARY_SANDORIA2) or
        (player:getMissionStatus(player:getNation()) > 9 and
        (
            player:getCurrentMission(invaderXim.mission.log_id.WINDURST) == invaderXim.mission.id.windurst.THE_THREE_KINGDOMS_SANDORIA2 or
            player:getCurrentMission(invaderXim.mission.log_id.BASTOK) == invaderXim.mission.id.bastok.THE_EMISSARY_SANDORIA2
        ))
end

content.groups =
{
    {
        mobIds =
        {
            { horlaisID.mob.DREAD_DRAGON,     horlaisID.mob.DREAD_DRAGON + 1 },
            { horlaisID.mob.DREAD_DRAGON + 2, horlaisID.mob.DREAD_DRAGON + 3 },
            { horlaisID.mob.DREAD_DRAGON + 4, horlaisID.mob.DREAD_DRAGON + 5 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
