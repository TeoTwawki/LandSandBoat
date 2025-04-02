-----------------------------------
-- Abyssea Sturdy Pyxis - Key item
-----------------------------------
xi = xi or {}
invaderXim.pyxis = invaderXim.pyxis or {}

invaderXim.pyxis.ki = {}

-----------------------------------
-- drop id's for keyitems
-- use zone id as the key
-----------------------------------
local drops =
{
    [invaderXim.zone.ABYSSEA_KONSCHTAT]  =
    {
        invaderXim.ki.FRAGRANT_TREANT_PETAL,
        invaderXim.ki.FETID_RAFFLESIA_STALK,
        invaderXim.ki.DECAYING_MORBOL_TOOTH,
        invaderXim.ki.TURBID_SLIME_OIL,
        invaderXim.ki.VENOMOUS_PEISTE_CLAW,
        invaderXim.ki.TATTERED_HIPPOGRYPH_WING,
        invaderXim.ki.CRACKED_WIVRE_HORN,
        invaderXim.ki.MUCID_AHRIMAN_EYEBALL,
    },

    [invaderXim.zone.ABYSSEA_TAHRONGI] =
    {
        invaderXim.ki.OVERGROWN_MANDRAGORA_FLOWER,
        invaderXim.ki.MOSSY_ADAMANTOISE_SHELL,
        invaderXim.ki.CHIPPED_SANDWORM_TOOTH,
        invaderXim.ki.GORY_SCORPION_CLAW,
        invaderXim.ki.FAT_LINED_COCKATRICE_SKIN,
        invaderXim.ki.SODDEN_SANDWORM_HUSK,
        invaderXim.ki.LUXURIANT_MANTICORE_MANE,
        invaderXim.ki.STICKY_GNAT_WING,
        invaderXim.ki.TORN_BAT_WING,
        invaderXim.ki.VEINOUS_HECTEYES_EYELID,
    },

    [invaderXim.zone.ABYSSEA_LA_THEINE] =
    {
        invaderXim.ki.MARBLED_MUTTON_CHOP,
        invaderXim.ki.BLOODIED_SABER_TOOTH,
        invaderXim.ki.BLOOD_SMEARED_GIGAS_HELM,
        invaderXim.ki.PELLUCID_FLY_EYE,
        invaderXim.ki.SHIMMERING_PIXIE_PINION,
        invaderXim.ki.WARPED_GIGAS_ARMBAND,
        invaderXim.ki.SEVERED_GIGAS_COLLAR,
        invaderXim.ki.DENTED_GIGAS_SHIELD,
        invaderXim.ki.GLITTERING_PIXIE_CHOKER,
    },

    [invaderXim.zone.ABYSSEA_ATTOHWA] =
    {
        invaderXim.ki.BULBOUS_CRAWLER_COCOON,
        invaderXim.ki.DISTENDED_CHIGOE_ABDOMEN,
        invaderXim.ki.VENOMOUS_WAMOURA_FEELER,
        invaderXim.ki.MUCID_WORM_SEGMENT,
        invaderXim.ki.SHRIVELED_HECTEYES_STALK,
        invaderXim.ki.CRACKED_SKELETON_CLAVICLE,
    },

    [invaderXim.zone.ABYSSEA_MISAREAUX] =
    {
        invaderXim.ki.CLIPPED_BIRD_WING,
        invaderXim.ki.GLISTENING_OROBON_LIVER,
        invaderXim.ki.GNARLED_LIZARD_NAIL,
        invaderXim.ki.JAGGED_APKALLU_BEAK,
        invaderXim.ki.DOFFED_POROGGO_HAT,
        invaderXim.ki.MOLTED_PEISTE_SKIN,
    },

    [invaderXim.zone.ABYSSEA_VUNKERL] =
    {
        invaderXim.ki.OSSIFIED_GARGOUILLE_HAND,
        invaderXim.ki.INGROWN_TAURUS_NAIL,
        invaderXim.ki.IMBRUED_VAMPYR_FANG,
        invaderXim.ki.PULSATING_SOULFLAYER_BEARD,
        invaderXim.ki.GLOSSY_SEA_MONK_SUCKER,
    },

    -- TODO: Populate KI Values for these Zones
    [invaderXim.zone.ABYSSEA_ALTEPA]     = { 0, 0, 0 },
    [invaderXim.zone.ABYSSEA_ULEGUERAND] = { 0, 0, 0 },
    [invaderXim.zone.ABYSSEA_GRAUBERG]   = { 0, 0, 0 },
}

invaderXim.pyxis.ki.setKeyItems = function(npc)
    local zoneId = npc:getZoneID()
    local ki = drops[zoneId][math.random(1, #drops[zoneId])]

    npc:setLocalVar('KI', ki)
end

invaderXim.pyxis.ki.updateEvent = function(player, npc)
    player:updateEvent(npc:getLocalVar('KI'), 0, 0, 0, 0, 0, 0, 0)
end

invaderXim.pyxis.ki.giveKeyItem = function(player, npc)
    local keyItem = npc:getLocalVar('KI')
    local zoneId = player:getZoneID()

    if keyItem == 0 then
        player:messageSpecial(zones[zoneId].text.KEYITEM_DISAPPEARED)
        return
    elseif player:hasKeyItem(keyItem) then
        player:messageSpecial(zones[zoneId].text.ALREADY_POSSESS_KEY_ITEM)
        return
    else
        player:addKeyItem(keyItem)
        invaderXim.pyxis.messageChest(player, zones[zoneId].text.OBTAINS_KEYITEM, keyItem, 0, 0, 0)
        npc:setLocalVar('KI', 0)
    end

    if npc:getLocalVar('KI') == 0 then
        invaderXim.pyxis.removeChest(player, npc, 0, 3)
    end
end
