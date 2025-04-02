-----------------------------------
-- Crafting utility functions
-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.crafting = invaderXim.crafting or {}
-----------------------------------
-- Document the "Guild_Member" bitmask.
-- Bit  0: Has joined Fishing guild.
-- Bit  1: Has joined Woodworking guild.
-- Bit  2: Has joined Smithing guild.
-- Bit  3: Has joined Goldsmithing guild.
-- Bit  4: Has joined Clothcraft guild.
-- Bit  5: Has joined Leathercraft guild.
-- Bit  6: Has joined Bonecraft guild.
-- Bit  7: Has joined Alchemy guild.
-- Bit  8: Has joined Cooking guild.

-- Bit 24: Has spoken to "Fatimah" after joining Goldsmithing guild.
-- Bit 25: Has spoken to "Azima" afer joining Alchemy guild.

-- Bit 27: Unknown, but this bits are used. Captured them on a lvl 110 Alchemist with a stage 2 Escutcheon completed.
-- Bit 28: Unknown, but this bits are used. Captured them on a lvl 110 Alchemist with a stage 2 Escutcheon completed.
-- Bit 29: Unknown, but this bits are used. Captured them on a lvl 110 Alchemist with a stage 2 Escutcheon completed.
-- Bit 30: Unknown, but this bits are used. Captured them on a lvl 110 Alchemist with a stage 2 Escutcheon completed.

invaderXim.crafting.guildTable =
{
    --           [guild ID] = { skill used,            'currency used'      },
    [invaderXim.guild.FISHING     ] = { invaderXim.skill.FISHING,      'guild_fishing'      },
    [invaderXim.guild.WOODWORKING ] = { invaderXim.skill.WOODWORKING,  'guild_woodworking'  },
    [invaderXim.guild.SMITHING    ] = { invaderXim.skill.SMITHING,     'guild_smithing'     },
    [invaderXim.guild.GOLDSMITHING] = { invaderXim.skill.GOLDSMITHING, 'guild_goldsmithing' },
    [invaderXim.guild.CLOTHCRAFT  ] = { invaderXim.skill.CLOTHCRAFT,   'guild_weaving'      },
    [invaderXim.guild.LEATHERCRAFT] = { invaderXim.skill.LEATHERCRAFT, 'guild_leathercraft' },
    [invaderXim.guild.BONECRAFT   ] = { invaderXim.skill.BONECRAFT,    'guild_bonecraft'    },
    [invaderXim.guild.ALCHEMY     ] = { invaderXim.skill.ALCHEMY,      'guild_alchemy'      },
    [invaderXim.guild.COOKING     ] = { invaderXim.skill.COOKING,      'guild_cooking'      },
}

invaderXim.crafting.craftMod =
{
    [invaderXim.skill.FISHING     ] = invaderXim.mod.FISH,
    [invaderXim.skill.WOODWORKING ] = invaderXim.mod.WOOD,
    [invaderXim.skill.SMITHING    ] = invaderXim.mod.SMITH,
    [invaderXim.skill.GOLDSMITHING] = invaderXim.mod.GOLDSMITH,
    [invaderXim.skill.CLOTHCRAFT  ] = invaderXim.mod.CLOTH,
    [invaderXim.skill.LEATHERCRAFT] = invaderXim.mod.LEATHER,
    [invaderXim.skill.BONECRAFT   ] = invaderXim.mod.BONE,
    [invaderXim.skill.ALCHEMY     ] = invaderXim.mod.ALCHEMY,
    [invaderXim.skill.COOKING     ] = invaderXim.mod.COOK,
}

invaderXim.crafting.hasJoinedGuild = function(player, guildId)
    local joinedGuildMask = player:getCharVar('Guild_Member')

    return utils.mask.getBit(joinedGuildMask, guildId)
end

invaderXim.crafting.getCraftSkillCap = function(player, skillId)
    local rank = player:getSkillRank(skillId)

    return (rank + 1) * 10
end

invaderXim.crafting.getRealSkill = function(player, skillId)
    return math.floor(player:getCharSkillLevel(skillId) / 10)
end

invaderXim.crafting.getTotalSkill = function(player, skillId)
    local skill = invaderXim.crafting.getRealSkill(player, skillId)
    local mod   = player:getMod(invaderXim.crafting.craftMod[skillId])

    return skill + mod
end
