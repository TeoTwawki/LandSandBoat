-----------------------------------
-- Teleport Spell Utilities
-----------------------------------
require('scripts/globals/teleports')
-----------------------------------
xi = xi or {}
invaderXim.spells = invaderXim.spells or {}
invaderXim.spells.enhancing = invaderXim.spells.enhancing or {}
-----------------------------------
-- Table variables.
local column =
{
    TELEPORT_ID       = 1,
    TELEPORT_KEY_ITEM = 2,
    TELEPORT_DURATION = 3,
    TELEPORT_CAMPAIGN = 4,
}

local pTable =
{
-- Structure:       [spellId] = { Teleport, Key_Item, duration, campaign },
    [invaderXim.magic.spell.ESCAPE        ] = { invaderXim.teleport.id.ESCAPE,  0,                              4, false },
    [invaderXim.magic.spell.RECALL_JUGNER ] = { invaderXim.teleport.id.JUGNER,  invaderXim.ki.JUGNER_GATE_CRYSTAL,      4, false },
    [invaderXim.magic.spell.RECALL_MERIPH ] = { invaderXim.teleport.id.MERIPH,  invaderXim.ki.MERIPHATAUD_GATE_CRYSTAL, 4, false },
    [invaderXim.magic.spell.RECALL_PASHH  ] = { invaderXim.teleport.id.PASHH,   invaderXim.ki.PASHHOW_GATE_CRYSTAL,     4, false },
    [invaderXim.magic.spell.RETRACE       ] = { invaderXim.teleport.id.RETRACE, 0,                              3, true  },
    [invaderXim.magic.spell.TELEPORT_ALTEP] = { invaderXim.teleport.id.ALTEP,   invaderXim.ki.ALTEPA_GATE_CRYSTAL,      4, false },
    [invaderXim.magic.spell.TELEPORT_DEM  ] = { invaderXim.teleport.id.DEM,     invaderXim.ki.DEM_GATE_CRYSTAL,         4, false },
    [invaderXim.magic.spell.TELEPORT_HOLLA] = { invaderXim.teleport.id.HOLLA,   invaderXim.ki.HOLLA_GATE_CRYSTAL,       4, false },
    [invaderXim.magic.spell.TELEPORT_MEA  ] = { invaderXim.teleport.id.MEA,     invaderXim.ki.MEA_GATE_CRYSTAL,         4, false },
    [invaderXim.magic.spell.TELEPORT_VAHZL] = { invaderXim.teleport.id.VAHZL,   invaderXim.ki.VAHZL_GATE_CRYSTAL,       4, false },
    [invaderXim.magic.spell.TELEPORT_YHOAT] = { invaderXim.teleport.id.YHOAT,   invaderXim.ki.YHOATOR_GATE_CRYSTAL,     4, false },
    [invaderXim.magic.spell.WARP          ] = { invaderXim.teleport.id.WARP,    0,                              3, false },
    [invaderXim.magic.spell.WARP_II       ] = { invaderXim.teleport.id.WARP,    0,                              3, false },
}

-- Check for "Retrace" Spell.
invaderXim.spells.enhancing.checkTeleportSpell = function(caster, target, spell)
    if target:getCampaignAllegiance() > 0 then
        return 0
    else
        return 48
    end
end

-- Main function for Teleport / Warp / etc. Spells.
invaderXim.spells.enhancing.useTeleportSpell = function(caster, target, spell)
    local spellId    = spell:getID()
    local teleportId = pTable[spellId][column.TELEPORT_ID]
    local keyItem    = pTable[spellId][column.TELEPORT_KEY_ITEM]
    local duration   = pTable[spellId][column.TELEPORT_DURATION]
    local campaign   = pTable[spellId][column.TELEPORT_CAMPAIGN]

    if
        target:getObjType() == invaderXim.objType.PC and
        (keyItem == 0 or (keyItem > 0 and target:hasKeyItem(keyItem))) and
        (not campaign or (campaign and target:getCampaignAllegiance() > 0))
    then
        target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, teleportId, 0, duration)
        spell:setMsg(invaderXim.msg.basic.MAGIC_TELEPORT)
    else
        spell:setMsg(invaderXim.msg.basic.NONE)
    end

    return 0
end
