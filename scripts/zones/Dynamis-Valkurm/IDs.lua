-----------------------------------
-- Area: Dynamis-Valkurm
-----------------------------------
zones = zones or {}

zones[invaderXim.zone.DYNAMIS_VALKURM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6385, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6391, -- Obtained: <item>.
        GIL_OBTAINED                  = 6392, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6394, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS           = 7002, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7003, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                  = 7004, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED = 7024, -- Your party is unable to participate because certain members' levels are restricted.
        CONQUEST_BASE                 = 7168, -- Tallying conquest results...
        DYNAMIS_TIME_BEGIN            = 7333, -- The sands of the <item> have begun to fall. You have <number> minutes (Earth time) remaining in Dynamis.
        DYNAMIS_TIME_EXTEND           = 7334, -- our stay in Dynamis has been extended by <number> minute[/s].
        DYNAMIS_TIME_UPDATE_1         = 7335, -- ou will be expelled from Dynamis in <number> [second/minute] (Earth time).
        DYNAMIS_TIME_UPDATE_2         = 7336, -- ou will be expelled from Dynamis in <number> [seconds/minutes] (Earth time).
        DYNAMIS_TIME_EXPIRED          = 7338, -- The sands of the hourglass have emptied...
        DYNAMIS_SUB_UNLOCKED          = 7343, -- Memories of skills long forgotten come flooding back to you...
        OMINOUS_PRESENCE              = 7350, -- You feel an ominous presence, as if something might happen if you possessed <item>.
    },
    mob =
    {
        TIME_EXTENSION =
        {
            { minutes = 10, ki = invaderXim.ki.CRIMSON_GRANULES_OF_TIME,   mob = 16937214 },
            { minutes = 10, ki = invaderXim.ki.AZURE_GRANULES_OF_TIME,     mob = 16937239 },
            { minutes = 10, ki = invaderXim.ki.AMBER_GRANULES_OF_TIME,     mob = 16937264 },
            { minutes = 10, ki = invaderXim.ki.ALABASTER_GRANULES_OF_TIME, mob = 16937289 },
            { minutes = 20, ki = invaderXim.ki.OBSIDIAN_GRANULES_OF_TIME,  mob = { 16937500, 16937525, 16937550, 16937575 } },
        },

        REFILL_STATUE =
        {
            {
                { mob = 16937208, eye = invaderXim.dynamis.eye.RED   }, -- Serjeant_Tombstone
                { mob = 16937209, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937210, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937211, eye = invaderXim.dynamis.eye.RED   }, -- Serjeant_Tombstone
                { mob = 16937212, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937213, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937233, eye = invaderXim.dynamis.eye.RED   }, -- Adamantking_Effigy
                { mob = 16937234, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937235, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937236, eye = invaderXim.dynamis.eye.RED   }, -- Adamantking_Effigy
                { mob = 16937237, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937238, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937258, eye = invaderXim.dynamis.eye.RED   }, -- Manifest_Icon
                { mob = 16937259, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937260, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937261, eye = invaderXim.dynamis.eye.RED   }, -- Manifest_Icon
                { mob = 16937262, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937263, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937283, eye = invaderXim.dynamis.eye.RED   }, -- Goblin_Replica
                { mob = 16937284, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937285, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937286, eye = invaderXim.dynamis.eye.RED   }, -- Goblin_Replica
                { mob = 16937287, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937288, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937494, eye = invaderXim.dynamis.eye.RED   }, -- Serjeant_Tombstone
                { mob = 16937495, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937496, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937497, eye = invaderXim.dynamis.eye.RED   }, -- Serjeant_Tombstone
                { mob = 16937498, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937499, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937519, eye = invaderXim.dynamis.eye.RED   }, -- Adamantking_Effigy
                { mob = 16937520, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937521, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937522, eye = invaderXim.dynamis.eye.RED   }, -- Adamantking_Effigy
                { mob = 16937523, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937524, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937544, eye = invaderXim.dynamis.eye.RED   }, -- Manifest_Icon
                { mob = 16937545, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937546, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937547, eye = invaderXim.dynamis.eye.RED   }, -- Manifest_Icon
                { mob = 16937548, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937549, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937569, eye = invaderXim.dynamis.eye.RED   }, -- Goblin_Replica
                { mob = 16937570, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937571, eye = invaderXim.dynamis.eye.GREEN },
            },

            {
                { mob = 16937572, eye = invaderXim.dynamis.eye.RED   }, -- Goblin_Replica
                { mob = 16937573, eye = invaderXim.dynamis.eye.BLUE  },
                { mob = 16937574, eye = invaderXim.dynamis.eye.GREEN },
            },
        },
    },

    npc =
    {
        QM =
        {
            -- [16937586] =
            -- {
            --     param = { 3456, 3470, 3471, 3472, 3473 },
            --     trade =
            --     {
            --         { item = 3456,                     mob = 16936961 }, -- Cirrate Christelle
            --         { item = { 3470, 3471, 3472, 3473 }, mob = 16937290 }, -- Arch Christelle
            --     }
            -- },
            -- [16937587] = { trade = { { item = 3461, mob = 16937311 } } }, -- Lost Nant'ina
            -- [16937588] = { trade = { { item = 3460, mob = 16937432 } } }, -- Lost Fairy Ring
            -- [16937589] = { trade = { { item = 3462, mob = 16937415 } } }, -- Lost Stcemqestcint
        },
    },
}

return zones[invaderXim.zone.DYNAMIS_VALKURM]
