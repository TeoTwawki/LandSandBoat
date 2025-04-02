-----------------------------------
-- Area: Balgas Dais
-- Name: Saintly Invitation
-- !pos 299 -123 345 146
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = BattlefieldMission:new({
    zoneId                = invaderXim.zone.BALGAS_DAIS,
    battlefieldId         = invaderXim.battlefield.id.SAINTLY_INVITATION,
    canLoseExp            = false,
    isMission             = true,
    allowTrusts           = true,
    maxPlayers            = 6,
    levelCap              = 75,
    timeLimit             = utils.minutes(30),
    index                 = 3,
    entryNpc              = 'BC_Entrance',
    exitNpc               = 'Burning_Circle',
    missionArea           = invaderXim.mission.log_id.WINDURST,
    mission               = invaderXim.mission.id.windurst.SAINTLY_INVITATION,
    missionStatusArea     = invaderXim.mission.log_id.WINDURST,
    requiredMissionStatus = 1,
})

content.groups =
{
    {
        mobIds =
        {
            {
                balgasID.mob.BUU_XOLO_THE_BLOODFACED,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 1,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 2,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 3,
            },

            {
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 6,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 7,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 8,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 9,
            },

            {
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 12,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 13,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 14,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 15,
            },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },

    {
        mobIds =
        {
            {
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 4,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 5,
            },

            {
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 10,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 11,
            },

            {
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 16,
                balgasID.mob.BUU_XOLO_THE_BLOODFACED + 17,
            },
        },

        spawned = false,
    },
}

return content:register()
