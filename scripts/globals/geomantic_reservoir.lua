-----------------------------------
-- SOA Geomantic Reservoirs
-----------------------------------
-----------------------------------

xi = xi or {}
invaderXim.geomanticReservoir = invaderXim.geomanticReservoir or {}

-- This table was necessary in order for us to be able to print the name of the newly learned spell.
local geoSpellTable =
{
    [invaderXim.magic.spell.GEO_POISON    ] = { invaderXim.item.GEO_POISON     },
    [invaderXim.magic.spell.GEO_VOIDANCE  ] = { invaderXim.item.GEO_VOIDANCE   },
    [invaderXim.magic.spell.GEO_PRECISION ] = { invaderXim.item.GEO_PRECISION  },
    [invaderXim.magic.spell.GEO_REGEN     ] = { invaderXim.item.GEO_REGEN      },
    [invaderXim.magic.spell.GEO_ATTUNEMENT] = { invaderXim.item.GEO_ATTUNEMENT },
    [invaderXim.magic.spell.GEO_FOCUS     ] = { invaderXim.item.GEO_FOCUS      },
    [invaderXim.magic.spell.GEO_BARRIER   ] = { invaderXim.item.GEO_BARRIER    },
    [invaderXim.magic.spell.GEO_REFRESH   ] = { invaderXim.item.GEO_REFRESH    },
    [invaderXim.magic.spell.GEO_CHR       ] = { invaderXim.item.GEO_CHR        },
    [invaderXim.magic.spell.GEO_MND       ] = { invaderXim.item.GEO_MND        },
    [invaderXim.magic.spell.GEO_FURY      ] = { invaderXim.item.GEO_FURY       },
    [invaderXim.magic.spell.GEO_INT       ] = { invaderXim.item.GEO_INT        },
    [invaderXim.magic.spell.GEO_AGI       ] = { invaderXim.item.GEO_AGI        },
    [invaderXim.magic.spell.GEO_POISON    ] = { invaderXim.item.GEO_POISON     },
    [invaderXim.magic.spell.GEO_FEND      ] = { invaderXim.item.GEO_FEND       },
    [invaderXim.magic.spell.GEO_VIT       ] = { invaderXim.item.GEO_VIT        },
    [invaderXim.magic.spell.GEO_DEX       ] = { invaderXim.item.GEO_DEX        },
    [invaderXim.magic.spell.GEO_ACUMEN    ] = { invaderXim.item.GEO_ACUMEN     },
    [invaderXim.magic.spell.GEO_STR       ] = { invaderXim.item.GEO_STR        },
    [invaderXim.magic.spell.GEO_SLOW      ] = { invaderXim.item.GEO_SLOW       },
    [invaderXim.magic.spell.GEO_TORPOR    ] = { invaderXim.item.GEO_TORPOR     },
    [invaderXim.magic.spell.GEO_SLIP      ] = { invaderXim.item.GEO_SLIP       },
    [invaderXim.magic.spell.GEO_LANGUOR   ] = { invaderXim.item.GEO_LANGUOR    },
    [invaderXim.magic.spell.GEO_PARALYSIS ] = { invaderXim.item.GEO_PARALYSIS  },
    [invaderXim.magic.spell.GEO_VEX       ] = { invaderXim.item.GEO_VEX        },
    [invaderXim.magic.spell.GEO_FRAILTY   ] = { invaderXim.item.GEO_FRAILTY    },
    [invaderXim.magic.spell.GEO_WILT      ] = { invaderXim.item.GEO_WILT       },
    [invaderXim.magic.spell.GEO_MALAISE   ] = { invaderXim.item.GEO_MALAISE    },
    [invaderXim.magic.spell.GEO_GRAVITY   ] = { invaderXim.item.GEO_GRAVITY    },
    [invaderXim.magic.spell.GEO_HASTE     ] = { invaderXim.item.GEO_HASTE      },
    [invaderXim.magic.spell.GEO_FADE      ] = { invaderXim.item.GEO_FADE       },
}

-- need to check if you have the indi spell before learning the geo spell
-- https://www.bg-wiki.com/ffxi/Geomantic_Reservoir
local indiSpellMap =
{
    [invaderXim.magic.spell.GEO_POISON    ] = invaderXim.magic.spell.INDI_POISON,
    [invaderXim.magic.spell.GEO_VOIDANCE  ] = invaderXim.magic.spell.INDI_VOIDANCE,
    [invaderXim.magic.spell.GEO_PRECISION ] = invaderXim.magic.spell.INDI_PRECISION,
    [invaderXim.magic.spell.GEO_REGEN     ] = invaderXim.magic.spell.INDI_REGEN,
    [invaderXim.magic.spell.GEO_ATTUNEMENT] = invaderXim.magic.spell.INDI_ATTUNEMENT,
    [invaderXim.magic.spell.GEO_FOCUS     ] = invaderXim.magic.spell.INDI_FOCUS,
    [invaderXim.magic.spell.GEO_BARRIER   ] = invaderXim.magic.spell.INDI_BARRIER,
    [invaderXim.magic.spell.GEO_REFRESH   ] = invaderXim.magic.spell.INDI_REFRESH,
    [invaderXim.magic.spell.GEO_CHR       ] = invaderXim.magic.spell.INDI_CHR,
    [invaderXim.magic.spell.GEO_MND       ] = invaderXim.magic.spell.INDI_MND,
    [invaderXim.magic.spell.GEO_FURY      ] = invaderXim.magic.spell.INDI_FURY,
    [invaderXim.magic.spell.GEO_INT       ] = invaderXim.magic.spell.INDI_INT,
    [invaderXim.magic.spell.GEO_AGI       ] = invaderXim.magic.spell.INDI_AGI,
    [invaderXim.magic.spell.GEO_POISON    ] = invaderXim.magic.spell.INDI_POISON,
    [invaderXim.magic.spell.GEO_FEND      ] = invaderXim.magic.spell.INDI_FEND,
    [invaderXim.magic.spell.GEO_VIT       ] = invaderXim.magic.spell.INDI_VIT,
    [invaderXim.magic.spell.GEO_DEX       ] = invaderXim.magic.spell.INDI_DEX,
    [invaderXim.magic.spell.GEO_ACUMEN    ] = invaderXim.magic.spell.INDI_ACUMEN,
    [invaderXim.magic.spell.GEO_STR       ] = invaderXim.magic.spell.INDI_STR,
    [invaderXim.magic.spell.GEO_SLOW      ] = invaderXim.magic.spell.INDI_SLOW,
    [invaderXim.magic.spell.GEO_TORPOR    ] = invaderXim.magic.spell.INDI_TORPOR,
    [invaderXim.magic.spell.GEO_SLIP      ] = invaderXim.magic.spell.INDI_SLIP,
    [invaderXim.magic.spell.GEO_LANGUOR   ] = invaderXim.magic.spell.INDI_LANGUOR,
    [invaderXim.magic.spell.GEO_PARALYSIS ] = invaderXim.magic.spell.INDI_PARALYSIS,
    [invaderXim.magic.spell.GEO_VEX       ] = invaderXim.magic.spell.INDI_VEX,
    [invaderXim.magic.spell.GEO_FRAILTY   ] = invaderXim.magic.spell.INDI_FRAILTY,
    [invaderXim.magic.spell.GEO_WILT      ] = invaderXim.magic.spell.INDI_WILT,
    [invaderXim.magic.spell.GEO_MALAISE   ] = invaderXim.magic.spell.INDI_MALAISE,
    [invaderXim.magic.spell.GEO_GRAVITY   ] = invaderXim.magic.spell.INDI_GRAVITY,
    [invaderXim.magic.spell.GEO_HASTE     ] = invaderXim.magic.spell.INDI_HASTE,
    [invaderXim.magic.spell.GEO_FADE      ] = invaderXim.magic.spell.INDI_FADE,
}

invaderXim.geomanticReservoir.onTrigger = function(player, npc, geoSpell)
    -- TODO: According to BG-Wiki there is a sequence here that a player can proc '!!' and achieve a Geomancy skill-up.
    -- TODO: is there different messaging if you don't know the indi spell vs already having the geo spell?
    -- https://www.bg-wiki.com/ffxi/Geomantic_Reservoir
    local procEffectTime = math.random(230, 300)
    local indiSpell = indiSpellMap[geoSpell]

    if
        player:getMainJob() == invaderXim.job.GEO and
        not player:hasSpell(geoSpell) and
        indiSpell and
        player:hasSpell(indiSpell)
    then
        player:startEvent(15000,  procEffectTime)
        -- TODO add skillup logic if player clicks at the time the proc happens
    else
        player:messageSpecial(zones[player:getZoneID()].text.NOTHING_OUT_OF_ORDINARY)
    end
end

invaderXim.geomanticReservoir.onEventFinish = function(player, csid, geoSpell)
    if csid == 15000 then
        player:addSpell(geoSpell, true, true) -- Quiesce the baked in message from addSpell(), we prefer the one below.
        player:messageSpecial(zones[player:getZoneID()].text.LEARNS_SPELL, geoSpellTable[geoSpell][1])
    end
end
