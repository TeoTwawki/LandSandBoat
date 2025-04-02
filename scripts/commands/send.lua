-----------------------------------
-- func: send <player1> (<player2) or zone)
-- desc: Teleport a player to:
-- A) The given zone
-- B) another player
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'b'
}

-----------------------------------
-- desc: List of zones with their auto-translated group and message id.
-- note: The format is as follows: groupId, messageId, zoneId
-----------------------------------
local zoneList =
{
    { 0x14, 0xA9, invaderXim.zone.PHANAUET_CHANNEL, 0, -2, 0   },
    { 0x14, 0xAA, invaderXim.zone.CARPENTERS_LANDING           },
    { 0x14, 0x84, invaderXim.zone.MANACLIPPER                  },
    { 0x14, 0x85, invaderXim.zone.BIBIKI_BAY                   },
    { 0x14, 0x8A, invaderXim.zone.ULEGUERAND_RANGE             },
    { 0x14, 0x8B, invaderXim.zone.BEARCLAW_PINNACLE            },
    { 0x14, 0x86, invaderXim.zone.ATTOHWA_CHASM                },
    { 0x14, 0x87, invaderXim.zone.BONEYARD_GULLY               },
    { 0x14, 0x88, invaderXim.zone.PSOXJA                       },
    { 0x14, 0x89, invaderXim.zone.THE_SHROUDED_MAW             },
    { 0x14, 0x8C, invaderXim.zone.OLDTON_MOVALPOLOS            },
    { 0x14, 0x8D, invaderXim.zone.NEWTON_MOVALPOLOS            },
    { 0x14, 0x8E, invaderXim.zone.MINE_SHAFT_2716              },
    { 0x14, 0xDC, invaderXim.zone.MINE_SHAFT_2716              },
    { 0x14, 0xAB, invaderXim.zone.HALL_OF_TRANSFERENCE         },
    { 0x14, 0x9B, invaderXim.zone.PROMYVION_HOLLA              },
    { 0x14, 0x9A, invaderXim.zone.PROMYVION_HOLLA              },
    { 0x14, 0x9C, invaderXim.zone.SPIRE_OF_HOLLA               },
    { 0x14, 0x9E, invaderXim.zone.PROMYVION_DEM, 179, 0, -57   },
    { 0x14, 0x9D, invaderXim.zone.PROMYVION_DEM, 179, 0, -57   },
    { 0x14, 0x9F, invaderXim.zone.SPIRE_OF_DEM                 },
    { 0x14, 0xA0, invaderXim.zone.PROMYVION_MEA                },
    { 0x14, 0xA1, invaderXim.zone.PROMYVION_MEA                },
    { 0x14, 0xA2, invaderXim.zone.SPIRE_OF_MEA                 },
    { 0x14, 0xA3, invaderXim.zone.PROMYVION_VAHZL              },
    { 0x14, 0xA4, invaderXim.zone.PROMYVION_VAHZL              },
    { 0x14, 0xA5, invaderXim.zone.PROMYVION_VAHZL              },
    { 0x14, 0xA6, invaderXim.zone.PROMYVION_VAHZL              },
    { 0x14, 0xA7, invaderXim.zone.SPIRE_OF_VAHZL               },
    { 0x14, 0xA8, invaderXim.zone.SPIRE_OF_VAHZL               },
    { 0x14, 0x90, invaderXim.zone.LUFAISE_MEADOWS              },
    { 0x14, 0x91, invaderXim.zone.MISAREAUX_COAST              },
    { 0x14, 0x8F, invaderXim.zone.TAVNAZIAN_SAFEHOLD           },
    { 0x14, 0x93, invaderXim.zone.PHOMIUNA_AQUEDUCTS           },
    { 0x14, 0x94, invaderXim.zone.SACRARIUM                    },
    { 0x14, 0x96, invaderXim.zone.RIVERNE_SITE_B01             },
    { 0x14, 0x95, invaderXim.zone.RIVERNE_SITE_B01             },
    { 0x14, 0x98, invaderXim.zone.RIVERNE_SITE_A01             },
    { 0x14, 0x97, invaderXim.zone.RIVERNE_SITE_A01             },
    { 0x14, 0x99, invaderXim.zone.MONARCH_LINN                 },
    { 0x14, 0x92, invaderXim.zone.SEALIONS_DEN                 },
    { 0x14, 0xAC, invaderXim.zone.ALTAIEU                      },
    { 0x14, 0xAD, invaderXim.zone.GRAND_PALACE_OF_HUXZOI       },
    { 0x14, 0xAE, invaderXim.zone.THE_GARDEN_OF_RUHMET         },
    { 0x14, 0xB0, invaderXim.zone.EMPYREAL_PARADOX             },
    { 0x14, 0xB1, invaderXim.zone.TEMENOS                      },
    { 0x14, 0xB2, invaderXim.zone.APOLLYON                     },
    { 0x14, 0xB4, invaderXim.zone.DYNAMIS_VALKURM              },
    { 0x14, 0xB5, invaderXim.zone.DYNAMIS_BUBURIMU             },
    { 0x14, 0xB6, invaderXim.zone.DYNAMIS_QUFIM                },
    { 0x14, 0xB7, invaderXim.zone.DYNAMIS_TAVNAZIA             },
    { 0x14, 0xAF, invaderXim.zone.DIORAMA_ABDHALJS_GHEIXIMA     },
    { 0x14, 0xB8, invaderXim.zone.ABDHALJS_ISLE_PURGONORGO     },
    { 0x14, 0xB9, invaderXim.zone.OPEN_SEA_ROUTE_TO_AL_ZAHBI   },
    { 0x14, 0xBA, invaderXim.zone.OPEN_SEA_ROUTE_TO_MHAURA     },
    { 0x14, 0xBB, invaderXim.zone.AL_ZAHBI                     },
    { 0x14, 0xDB, invaderXim.zone.AHT_URHGAN_WHITEGATE         },
    { 0x14, 0xBC, invaderXim.zone.AHT_URHGAN_WHITEGATE         },
    { 0x14, 0xBD, invaderXim.zone.WAJAOM_WOODLANDS             },
    { 0x14, 0xBE, invaderXim.zone.BHAFLAU_THICKETS             },
    { 0x14, 0xBF, invaderXim.zone.NASHMAU                      },
    { 0x14, 0xC0, invaderXim.zone.ARRAPAGO_REEF                },
    { 0x14, 0xC1, invaderXim.zone.ILRUSI_ATOLL                 },
    { 0x14, 0xC2, invaderXim.zone.PERIQIA                      },
    { 0x14, 0xC3, invaderXim.zone.TALACCA_COVE                 },
    { 0x14, 0xC4, invaderXim.zone.SILVER_SEA_ROUTE_TO_NASHMAU,  0, -2, 0 },
    { 0x14, 0xC5, invaderXim.zone.SILVER_SEA_ROUTE_TO_AL_ZAHBI, 0, -2, 0 },
    { 0x14, 0xC6, invaderXim.zone.THE_ASHU_TALIF               },
    { 0x14, 0xC7, invaderXim.zone.MOUNT_ZHAYOLM                },
    { 0x14, 0xC8, invaderXim.zone.HALVUNG                      },
    { 0x14, 0xC9, invaderXim.zone.LEBROS_CAVERN                },
    { 0x14, 0xCA, invaderXim.zone.NAVUKGO_EXECUTION_CHAMBER    },
    { 0x14, 0xCB, invaderXim.zone.MAMOOK                       },
    { 0x14, 0xCC, invaderXim.zone.MAMOOL_JA_TRAINING_GROUNDS   },
    { 0x14, 0xCD, invaderXim.zone.JADE_SEPULCHER               },
    { 0x14, 0xCE, invaderXim.zone.AYDEEWA_SUBTERRANE           },
    { 0x14, 0xCF, invaderXim.zone.LEUJAOAM_SANCTUM             },
    { 0x27, 0x0F, invaderXim.zone.CHOCOBO_CIRCUIT, -324, 0, -473 },
    { 0x27, 0x10, invaderXim.zone.THE_COLOSSEUM                },
    { 0x14, 0xDD, invaderXim.zone.ALZADAAL_UNDERSEA_RUINS      },
    { 0x14, 0xDE, invaderXim.zone.ZHAYOLM_REMNANTS             },
    { 0x14, 0xDF, invaderXim.zone.ARRAPAGO_REMNANTS            },
    { 0x14, 0xE0, invaderXim.zone.BHAFLAU_REMNANTS             },
    { 0x14, 0xE1, invaderXim.zone.SILVER_SEA_REMNANTS          },
    { 0x14, 0xE2, invaderXim.zone.NYZUL_ISLE                   },
    { 0x14, 0xDA, invaderXim.zone.HAZHALM_TESTING_GROUNDS      },
    { 0x14, 0xD0, invaderXim.zone.CAEDARVA_MIRE                },
    { 0x27, 0x11, invaderXim.zone.SOUTHERN_SAN_DORIA_S         },
    { 0x27, 0x13, invaderXim.zone.EAST_RONFAURE_S              },
    { 0x27, 0x15, invaderXim.zone.JUGNER_FOREST_S              },
    { 0x27, 0x23, invaderXim.zone.VUNKERL_INLET_S              },
    { 0x27, 0x17, invaderXim.zone.BATALLIA_DOWNS_S             },
    { 0x27, 0x3E, invaderXim.zone.LA_VAULE_S                   },
    { 0x27, 0x40, invaderXim.zone.LA_VAULE_S                   },
    { 0x27, 0x19, invaderXim.zone.EVERBLOOM_HOLLOW             },
    { 0x27, 0x1C, invaderXim.zone.BASTOK_MARKETS_S             },
    { 0x27, 0x1E, invaderXim.zone.NORTH_GUSTABERG_S            },
    { 0x27, 0x20, invaderXim.zone.GRAUBERG_S                   },
    { 0x27, 0x25, invaderXim.zone.PASHHOW_MARSHLANDS_S         },
    { 0x27, 0x27, invaderXim.zone.ROLANBERRY_FIELDS_S          },
    { 0x27, 0x42, invaderXim.zone.BEADEAUX_S                   },
    { 0x27, 0x22, invaderXim.zone.RUHOTZ_SILVERMINES           },
    { 0x27, 0x2B, invaderXim.zone.WINDURST_WATERS_S            },
    { 0x27, 0x2D, invaderXim.zone.WEST_SARUTABARUTA_S          },
    { 0x27, 0x2F, invaderXim.zone.FORT_KARUGO_NARUGO_S         },
    { 0x27, 0x32, invaderXim.zone.MERIPHATAUD_MOUNTAINS_S      },
    { 0x27, 0x34, invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S       },
    { 0x27, 0x44, invaderXim.zone.CASTLE_OZTROJA_S             },
    { 0x14, 0x11, invaderXim.zone.WEST_RONFAURE                },
    { 0x14, 0x0F, invaderXim.zone.EAST_RONFAURE                },
    { 0x14, 0x51, invaderXim.zone.LA_THEINE_PLATEAU            },
    { 0x14, 0x60, invaderXim.zone.VALKURM_DUNES                },
    { 0x14, 0x01, invaderXim.zone.JUGNER_FOREST                },
    { 0x14, 0x02, invaderXim.zone.BATALLIA_DOWNS               },
    { 0x14, 0x64, invaderXim.zone.NORTH_GUSTABERG              },
    { 0x14, 0x63, invaderXim.zone.SOUTH_GUSTABERG              },
    { 0x14, 0x69, invaderXim.zone.KONSCHTAT_HIGHLANDS          },
    { 0x14, 0x2B, invaderXim.zone.PASHHOW_MARSHLANDS           },
    { 0x14, 0x07, invaderXim.zone.ROLANBERRY_FIELDS            },
    { 0x14, 0x24, invaderXim.zone.BEAUCEDINE_GLACIER           },
    { 0x14, 0x4D, invaderXim.zone.XARCABARD                    },
    { 0x14, 0x3D, invaderXim.zone.CAPE_TERIGGAN                },
    { 0x14, 0x3E, invaderXim.zone.EASTERN_ALTEPA_DESERT        },
    { 0x14, 0x18, invaderXim.zone.WEST_SARUTABARUTA            },
    { 0x14, 0x27, invaderXim.zone.EAST_SARUTABARUTA            },
    { 0x14, 0x17, invaderXim.zone.TAHRONGI_CANYON              },
    { 0x14, 0x16, invaderXim.zone.BUBURIMU_PENINSULA           },
    { 0x14, 0x20, invaderXim.zone.MERIPHATAUD_MOUNTAINS        },
    { 0x14, 0x2E, invaderXim.zone.SAUROMUGUE_CHAMPAIGN         },
    { 0x14, 0x3F, invaderXim.zone.THE_SANCTUARY_OF_ZITAH       },
    { 0x14, 0x7D, invaderXim.zone.ROMAEVE                      },
    { 0x14, 0x7C, invaderXim.zone.ROMAEVE                      },
    { 0x14, 0x40, invaderXim.zone.YUHTUNGA_JUNGLE              },
    { 0x14, 0x41, invaderXim.zone.YHOATOR_JUNGLE               },
    { 0x14, 0x42, invaderXim.zone.WESTERN_ALTEPA_DESERT        },
    { 0x14, 0x08, invaderXim.zone.QUFIM_ISLAND                 },
    { 0x14, 0x0A, invaderXim.zone.BEHEMOTHS_DOMINION           },
    { 0x14, 0x43, invaderXim.zone.VALLEY_OF_SORROWS            },
    { 0x27, 0x31, invaderXim.zone.GHOYUS_REVERIE               },
    { 0x14, 0x6F, invaderXim.zone.RUAUN_GARDENS                },
    { 0x14, 0x82, invaderXim.zone.DYNAMIS_BEAUCEDINE           },
    { 0x14, 0x83, invaderXim.zone.DYNAMIS_XARCABARD            },
    { 0x27, 0x46, invaderXim.zone.BEAUCEDINE_GLACIER_S         },
    { 0x27, 0x48, invaderXim.zone.XARCABARD_S                  },
    { 0x14, 0x65, invaderXim.zone.HORLAIS_PEAK                 },
    { 0x14, 0x6C, invaderXim.zone.GHEIXIMA_OUTPOST              },
    { 0x14, 0x1F, invaderXim.zone.FORT_GHEIXIMA                 },
    { 0x14, 0x5E, invaderXim.zone.YUGHOTT_GROTTO               },
    { 0x14, 0x66, invaderXim.zone.PALBOROUGH_MINES             },
    { 0x14, 0x1A, invaderXim.zone.WAUGHROON_SHRINE             },
    { 0x14, 0x21, invaderXim.zone.GIDDEUS                      },
    { 0x14, 0x19, invaderXim.zone.BALGAS_DAIS                  },
    { 0x14, 0x2A, invaderXim.zone.BEADEAUX                     },
    { 0x14, 0x28, invaderXim.zone.QULUN_DOME                   },
    { 0x14, 0x68, invaderXim.zone.DAVOI                        },
    { 0x14, 0x6D, invaderXim.zone.MONASTIC_CAVERN              },
    { 0x14, 0x23, invaderXim.zone.CASTLE_OZTROJA               },
    { 0x14, 0x04, invaderXim.zone.ALTAR_ROOM                   },
    { 0x14, 0x44, invaderXim.zone.THE_BOYAHDA_TREE             },
    { 0x14, 0x37, invaderXim.zone.DRAGONS_AERY                 },
    { 0x14, 0x0C, invaderXim.zone.MIDDLE_DELKFUTTS_TOWER       },
    { 0x14, 0x0B, invaderXim.zone.UPPER_DELKFUTTS_TOWER        },
    { 0x14, 0x36, invaderXim.zone.TEMPLE_OF_UGGALEPIH          },
    { 0x14, 0x35, invaderXim.zone.DEN_OF_RANCOR                },
    { 0x14, 0x26, invaderXim.zone.CASTLE_ZVAHL_BAILEYS         },
    { 0x14, 0x25, invaderXim.zone.CASTLE_ZVAHL_BAILEYS         },
    { 0x14, 0x50, invaderXim.zone.CASTLE_ZVAHL_KEEP            },
    { 0x14, 0x4F, invaderXim.zone.CASTLE_ZVAHL_KEEP            },
    { 0x14, 0x39, invaderXim.zone.SACRIFICIAL_CHAMBER          },
    { 0x27, 0x36, invaderXim.zone.GARLAIGE_CITADEL_S           },
    { 0x14, 0x5D, invaderXim.zone.THRONE_ROOM                  },
    { 0x14, 0x2D, invaderXim.zone.RANGUEMONT_PASS              },
    { 0x14, 0x32, invaderXim.zone.BOSTAUNIEUX_OUBLIETTE        },
    { 0x14, 0x3B, invaderXim.zone.CHAMBER_OF_ORACLES           },
    { 0x14, 0x1D, invaderXim.zone.TORAIMARAI_CANAL             },
    { 0x14, 0x5C, invaderXim.zone.FULL_MOON_FOUNTAIN           },
    { 0x27, 0x29, invaderXim.zone.CRAWLERS_NEST_S              },
    { 0x14, 0x61, invaderXim.zone.ZERUHN_MINES                 },
    { 0x14, 0x5B, invaderXim.zone.KORROLOKA_TUNNEL             },
    { 0x14, 0x5A, invaderXim.zone.KUFTAL_TUNNEL                },
    { 0x27, 0x1A, invaderXim.zone.THE_ELDIEME_NECROPOLIS_S     },
    { 0x14, 0x59, invaderXim.zone.SEA_SERPENT_GROTTO           },
    { 0x14, 0x71, invaderXim.zone.VELUGANNON_PALACE            },
    { 0x14, 0x70, invaderXim.zone.VELUGANNON_PALACE            },
    { 0x14, 0x72, invaderXim.zone.THE_SHRINE_OF_RUAVITAU       },
    { 0x14, 0xB3, invaderXim.zone.STELLAR_FULCRUM              },
    { 0x14, 0x73, invaderXim.zone.LALOFF_AMPHITHEATER          },
    { 0x14, 0x74, invaderXim.zone.THE_CELESTIAL_NEXUS          },
    { 0x14, 0x0D, invaderXim.zone.LOWER_DELKFUTTS_TOWER        },
    { 0x14, 0x7E, invaderXim.zone.DYNAMIS_SAN_DORIA            },
    { 0x14, 0x7F, invaderXim.zone.DYNAMIS_BASTOK               },
    { 0x14, 0x80, invaderXim.zone.DYNAMIS_WINDURST             },
    { 0x14, 0x81, invaderXim.zone.DYNAMIS_JEUNO                },
    { 0x14, 0x6E, invaderXim.zone.KING_RANPERRES_TOMB          },
    { 0x14, 0x62, invaderXim.zone.DANGRUF_WADI                 },
    { 0x14, 0x1C, invaderXim.zone.INNER_HORUTOTO_RUINS         },
    { 0x14, 0x03, invaderXim.zone.ORDELLES_CAVES               },
    { 0x14, 0x1B, invaderXim.zone.OUTER_HORUTOTO_RUINS         },
    { 0x14, 0x6A, invaderXim.zone.THE_ELDIEME_NECROPOLIS       },
    { 0x14, 0x67, invaderXim.zone.GUSGEN_MINES                 },
    { 0x14, 0x2C, invaderXim.zone.CRAWLERS_NEST                },
    { 0x14, 0x15, invaderXim.zone.MAZE_OF_SHAKHRAMI            },
    { 0x14, 0x14, invaderXim.zone.GARLAIGE_CITADEL             },
    { 0x14, 0x77, invaderXim.zone.CLOISTER_OF_GALES            },
    { 0x14, 0x75, invaderXim.zone.CLOISTER_OF_STORMS           },
    { 0x14, 0x7A, invaderXim.zone.CLOISTER_OF_FROST            },
    { 0x14, 0x4A, invaderXim.zone.FEIYIN                       },
    { 0x14, 0x58, invaderXim.zone.IFRITS_CAULDRON              },
    { 0x14, 0x6B, invaderXim.zone.QUBIA_ARENA                  },
    { 0x14, 0x78, invaderXim.zone.CLOISTER_OF_FLAMES           },
    { 0x14, 0x57, invaderXim.zone.QUICKSAND_CAVES              },
    { 0x14, 0x76, invaderXim.zone.CLOISTER_OF_TREMORS          },
    { 0x14, 0x79, invaderXim.zone.CLOISTER_OF_TIDES            },
    { 0x14, 0x34, invaderXim.zone.GUSTAV_TUNNEL                },
    { 0x14, 0x33, invaderXim.zone.LABYRINTH_OF_ONZOZO          },
    { 0x14, 0x4C, invaderXim.zone.SOUTHERN_SAN_DORIA           },
    { 0x14, 0x30, invaderXim.zone.NORTHERN_SAN_DORIA           },
    { 0x14, 0x52, invaderXim.zone.PORT_SAN_DORIA               },
    { 0x14, 0x22, invaderXim.zone.CHATEAU_DORAGUILLE           },
    { 0x14, 0x46, invaderXim.zone.BASTOK_MINES                 },
    { 0x14, 0x56, invaderXim.zone.BASTOK_MARKETS               },
    { 0x14, 0x3C, invaderXim.zone.PORT_BASTOK                  },
    { 0x14, 0x2F, invaderXim.zone.METALWORKS                   },
    { 0x14, 0x3A, invaderXim.zone.WINDURST_WATERS              },
    { 0x14, 0x54, invaderXim.zone.WINDURST_WALLS               },
    { 0x14, 0x45, invaderXim.zone.PORT_WINDURST                },
    { 0x14, 0x38, invaderXim.zone.WINDURST_WOODS               },
    { 0x14, 0x55, invaderXim.zone.HEAVENS_TOWER                },
    { 0x14, 0x13, invaderXim.zone.RULUDE_GARDENS               },
    { 0x14, 0x4E, invaderXim.zone.UPPER_JEUNO                  },
    { 0x14, 0x0E, invaderXim.zone.LOWER_JEUNO                  },
    { 0x14, 0x06, invaderXim.zone.PORT_JEUNO                   },
    { 0x14, 0x31, invaderXim.zone.RABAO                        },
    { 0x14, 0x5F, invaderXim.zone.SELBINA                      },
    { 0x14, 0x1E, invaderXim.zone.MHAURA                       },
    { 0x14, 0x29, invaderXim.zone.KAZHAM                       },
    { 0x14, 0x7B, invaderXim.zone.HALL_OF_THE_GODS             },
    { 0x14, 0x09, invaderXim.zone.NORG                         },
    { 0x27, 0x4C, invaderXim.zone.WESTERN_ADOULIN              },
    { 0x27, 0x4D, invaderXim.zone.EASTERN_ADOULIN              },
    { 0x27, 0x4E, invaderXim.zone.RALA_WATERWAYS               },
    { 0x27, 0x4F, invaderXim.zone.YAHSE_HUNTING_GROUNDS        },
    { 0x27, 0x50, invaderXim.zone.CEIZAK_BATTLEGROUNDS         },
    { 0x27, 0x51, invaderXim.zone.FORET_DE_HENNETIEL           },
    { 0x27, 0x56, invaderXim.zone.YORCIA_WEALD                 },
    { 0x27, 0x52, invaderXim.zone.MORIMAR_BASALT_FIELDS        },
    { 0x27, 0x57, invaderXim.zone.MARJAMI_RAVINE               },
    { 0x27, 0x5C, invaderXim.zone.KAMIHR_DRIFTS                },
    { 0x27, 0x53, invaderXim.zone.SIH_GATES                    },
    { 0x27, 0x54, invaderXim.zone.MOH_GATES                    },
    { 0x27, 0x55, invaderXim.zone.CIRDAS_CAVERNS               },
    { 0x27, 0x58, invaderXim.zone.DHO_GATES                    },
    { 0x27, 0x5D, invaderXim.zone.WOH_GATES                    },
    { 0x27, 0x12, invaderXim.zone.OUTER_RAKAZNAR               },
    { 0x27, 0x5A, invaderXim.zone.MOG_GARDEN                   },
    { 0x27, 0x59, invaderXim.zone.CELENNIA_MEMORIAL_LIBRARY    },
    { 0x27, 0x5B, invaderXim.zone.FERETORY                     },
    { 0x14, 0x09, invaderXim.zone.ESCHA_ZITAH                  },
    { 0x27, 0x1B, invaderXim.zone.ESCHA_RUAUN                  },
    { 0x27, 0x1D, invaderXim.zone.REISENJIMA                   },
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!send <player to send> <destination player or zone>')
end

local function getBytePos(s, needle)
    for i = 1, string.len(s), 1 do
        if string.byte(s, i) == needle then
            return i
        end
    end

    return nil
end

-----------------------------------
-- func: onTrigger
-- desc: Called when this command is invoked.
-----------------------------------
commandObj.onTrigger = function(player, bytes)
    local x = 0
    local y = 0
    local z = 0
    local rot = 0
    local zone

    if bytes == nil then
        error(player, 'You must provide the name of a player to send and a destination.')
        return
    end

    bytes = string.sub(bytes, 6)
    local atpos = getBytePos(bytes, 253)
    local sppos = getBytePos(bytes, 32)

    -- validate player to send
    local target
    local targ
    if sppos == nil then
        error(player, 'You must provide the name of a player to send and a destination.')
        return
    else
        target = string.sub(bytes, 1, sppos-1)
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- validate destination
    if atpos ~= nil then
        -- destination is an auto-translate phrase
        local groupId = string.byte(bytes, atpos + 3)
        local messageId = string.byte(bytes, atpos + 4)
        for k, v in pairs(zoneList) do
            if v[1] == groupId and v[2] == messageId then
                x = v[4] or 0
                y = v[5] or 0
                z = v[6] or 0
                rot = 0
                zone = v[3]
                break
            end
        end

        if zone == nil then
            error(player, 'Auto-translated phrase is not a zone.')
            return
        end
    else
        local dest = string.sub(bytes, sppos + 1)
        if tonumber(dest) ~= nil then
            -- destination is a zone ID.
            zone = tonumber(dest)
            if zone < 0 or zone >= invaderXim.zone.MAX_ZONE then
                error(player, 'Invalid zone ID.')
                return
            end

            for k, v in pairs(zoneList) do
                if v[3] == zone then
                    x = v[4] or 0
                    y = v[5] or 0
                    z = v[6] or 0
                    rot = 0
                    zone = v[3]
                    break
                end
            end
        else
            -- destination is a player name.
            target = dest
            local playerObj = GetPlayerByName(dest)
            if playerObj == nil then
                error(player, string.format('Player named "%s" not found!', target))
                return
            end

            x    = playerObj:getXPos()
            y    = playerObj:getYPos()
            z    = playerObj:getZPos()
            rot  = playerObj:getRotPos()
            zone = playerObj:getZoneID()
        end
    end

    -- send target to destination
    targ:setPos(x, y, z, rot, zone)
    if targ:getID() ~= player:getID() then
        player:printToPlayer(string.format('Sent %s to zone %i.', targ:getName(), zone))
    end
end

return commandObj
