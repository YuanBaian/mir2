unit Enum;

interface

type
  TMouseCursor = (mcNone = 0, mcDefault, mcAttack, mcAttackRed, mcNPCTalk, mcTextPrompt, mcTrash, mcUpgrade);

  TPanelType = (ptBuy, ptBuySub, ptCraft, ptSell, ptRepair, ptSpecialRepair, ptConsign, ptRefine, ptCheckRefine, ptDisassemble, ptDowngrade, ptReset, ptCollectRefine, ptReplaceWedRing);

  TMarketItemType = (mitConsign, mitAuction, mitGameShop);

  TMarketPanelType = (mptMarket, mptConsign, mptAuction, mptGameShop);

  TBlendMode = (bmNONE = -1, bmNORMAL = 0, bmLIGHT = 1, bmLIGHTINV = 2, bmINVNORMAL = 3, bmINVLIGHT = 4, bmINVLIGHTINV = 5, bmINVCOLOR = 6, bmINVBACKGROUND = 7);

  TDamageType = (dtHit = 0, dtMiss = 1, dtCritical = 2);

  TGMOption = (gmNone = 0, gmGameMaster, gmObserver, gmSuperman);

  TGMOptions = set of TGMOption;

  TAwakeType = (awNone = 0, awDC, awMC, awSC, awAC, awMAC, awHPMP);
  //[Flags]

  TLevelEffects = (leNone = 0, leMist = $0001, leRedDragon = $0002, leBlueDragon = $0004);

  TOutputMessageType = (omtNormal, omtQuest, omtGuild);

  TItemGrade = (igNone = 0, igCommon = 1, igRare = 2, igLegendary = 3, igMythical = 4, igHeroic = 5);

  TRefinedValue = (rvNone = 0, rvDC = 1, rvMC = 2, rvSC = 3);

  TQuestType = (qtGeneral = 0, qtDaily = 1, qtRepeatable = 2, qtStory = 3);

  TQuestIcon = (qiNone = 0, qiQuestionWhite = 1, qiExclamationYellow = 2, qiQuestionYellow = 3, qiExclamationBlue = 5, qiQuestionBlue = 6, qiExclamationGreen = 52, qiQuestionGreen = 53);

  TQuestState = (qsAdd, qsUpdate, qsRemove);

  TQuestAction = (qaTimeExpired);

  TDefaultNPCType = (dntLogin, dntLevelUp, dntUseItem, dntMapCoord, dntMapEnter, dntDie, dntTrigger, dntCustomCommand, dntOnAcceptQuest, dntOnFinishQuest, dntDaily, dntClient);

  TIntelligentCreatureType = (ictNone = 99, ictBabyPig = 0, ictChick = 1, ictKitten = 2, ictBabySkeleton = 3, ictBaekdon = 4, ictWimaen = 5, ictBlackKitten = 6, ictBabyDragon = 7, ictOlympicFlame = 8, ictBabySnowMan = 9, ictFrog = 10, ictBabyMonkey = 11, ictAngryBird = 12, ictFoxey = 13, ictMedicalRat = 14);

  TMonster = (mGuard = 0, mTaoistGuard = 1, mGuard2 = 2, mHen = 3, mDeer = 4, mScarecrow = 5, mHookingCat = 6, mRakingCat = 7, mYob = 8, mOma = 9, mCannibalPlant = 10, mForestYeti = 11, mSpittingSpider = 12, mChestnutTree = 13, mEbonyTree = 14, mLargeMushroom = 15, mCherryTree = 16, mOmaFighter = 17, mOmaWarrior = 18, mCaveBat = 19, mCaveMaggot = 20, mScorpion = 21, mSkeleton = 22, mBoneFighter = 23, mAxeSkeleton = 24, mBoneWarrior = 25, mBoneElite = 26, mDung = 27, mDark = 28, mWoomaSoldier = 29, mWoomaFighter = 30, mWoomaWarrior = 31, mFlamingWooma = 32, mWoomaGuardian = 33, mWoomaTaurus = 34, //BOSS
    mWhimperingBee = 35, mGiantWorm = 36, mCentipede = 37, mBlackMaggot = 38, mTongs = 39, mEvilTongs = 40, mEvilCentipede = 41, mBugBat = 42, mBugBatMaggot = 43, mWedgeMoth = 44, mRedBoar = 45, mBlackBoar = 46, mSnakeScorpion = 47, mWhiteBoar = 48, mEvilSnake = 49, mBombSpider = 50, mRootSpider = 51, mSpiderBat = 52, mVenomSpider = 53, mGangSpider = 54, mGreatSpider = 55, mLureSpider = 56, mBigApe = 57, mEvilApe = 58, mGrayEvilApe = 59, mRedEvilApe = 60, mCrystalSpider = 61, mRedMoonEvil = 62, mBigRat = 63, mZumaArcher = 64, mZumaStatue = 65, mZumaGuardian = 66, mRedThunderZuma = 67, mZumaTaurus = 68, //BOSS
    mDigOutZombie = 69, mClZombie = 70, mNdZombie = 71, mCrawlerZombie = 72, mShamanZombie = 73, mGhoul = 74, mKingScorpion = 75, mKingHog = 76, mDarkDevil = 77, mBoneFamiliar = 78, mShinsu = 79, mShinsu1 = 80, mSpiderFrog = 81, mHoroBlaster = 82, mBlueHoroBlaster = 83, mKekTal = 84, mVioletKekTal = 85, mKhazard = 86, mRoninGhoul = 87, mToxicGhoul = 88, mBoneCaptain = 89, mBoneSpearman = 90, mBoneBlademan = 91, mBoneArcher = 92, mBoneLord = 93, //BOSS
    mMinotaur = 94, mIceMinotaur = 95, mElectricMinotaur = 96, mWindMinotaur = 97, mFireMinotaur = 98, mRightGuard = 99, mLeftGuard = 100, mMinotaurKing = 101, //BOSS
    mFrostTiger = 102, mSheep = 103, mWolf = 104, mShellNipper = 105, mKeratoid = 106, mGiantKeratoid = 107, mSkyStinger = 108, mSandWorm = 109, mVisceralWorm = 110, mRedSnake = 111, mTigerSnake = 112, mYimoogi = 113, mGiantWhiteSnake = 114, mBlueSnake = 115, mYellowSnake = 116, mHolyDeva = 117, mAxeOma = 118, mSwordOma = 119, mCrossbowOma = 120, mWingedOma = 121, mFlailOma = 122, mOmaGuard = 123, mYinDevilNode = 124, mYangDevilNode = 125, mOmaKing = 126, //BOSS
    mBlackFoxman = 127, mRedFoxman = 128, mWhiteFoxman = 129, mTrapRock = 130, mGuardianRock = 131, mThunderElement = 132, mCloudElement = 133, mGreatFoxSpirit = 134, //BOSS
    mHedgeKekTal = 135, mBigHedgeKekTal = 136, mRedFrogSpider = 137, mBrownFrogSpider = 138, mArcherGuard = 139, mKatanaGuard = 140, mArcherGuard2 = 141, mPig = 142, mBull = 143, mBush = 144, mChristmasTree = 145, mHighAssassin = 146, mDarkDustPile = 147, mDarkBrownWolf = 148, mFootball = 149, mGingerBreadman = 150, mHalloweenScythe = 151, mGhastlyLeecher = 152, mCyanoGhast = 153, mMutatedManworm = 154, mCrazyManworm = 155, mMudPile = 156, mTailedLion = 157, mBehemoth = 158, //BOSS
    mDarkDevourer = 159, mPoisonHugger = 160, mHugger = 161, mMutatedHugger = 162, mDreamDevourer = 163, mTreasurebox = 164, mSnowPile = 165, mSnowman = 166, mSnowTree = 167, mGiantEgg = 168, mRedTurtle = 169, mGreenTurtle = 170, mBlueTurtle = 171, mCatapult1 = 172, //SPECIAL TODO
    mCatapult2 = 173, //SPECIAL TODO
    mOldSpittingSpider = 174, mSiegeRepairman = 175, //SPECIAL TODO
    mBlueSanta = 176, mBattleStandard = 177, mBlank1 = 178, mRedYimoogi = 179, mLionRiderMale = 180, //Not Monster - Skin / Transform
    mLionRiderFemale = 181, //Not Monster - Skin / Transform
    mTornado = 182, mFlameTiger = 183, mWingedTigerLord = 184, //BOSS
    mTowerTurtle = 185, mFinialTurtle = 186, mTurtleKing = 187, //BOSS
    mDarkTurtle = 188, mLightTurtle = 189, mDarkSwordOma = 190, mDarkAxeOma = 191, mDarkCrossbowOma = 192, mDarkWingedOma = 193, mBoneWhoo = 194, mDarkSpider = 195, //AI 8
    mViscusWorm = 196, mViscusCrawler = 197, mCrawlerLave = 198, mDarkYob = 199, mFlamingMutant = 200, mStoningStatue = 201, //BOSS
    mFlyingStatue = 202, mValeBat = 203, mWeaver = 204, mVenomWeaver = 205, mCrackingWeaver = 206, mArmingWeaver = 207, mCrystalWeaver = 208, mFrozenZumaStatue = 209, mFrozenZumaGuardian = 210, mFrozenRedZuma = 211, mGreaterWeaver = 212, mSpiderWarrior = 213, mSpiderBarbarian = 214, mHellSlasher = 215, mHellPirate = 216, mHellCannibal = 217, mHellKeeper = 218, //BOSS
    mHellBolt = 219, mWitchDoctor = 220, mManectricHammer = 221, mManectricClub = 222, mManectricClaw = 223, mManectricStaff = 224, mNamelessGhost = 225, mDarkGhost = 226, mChaosGhost = 227, mManectricBlest = 228, mManectricKing = 229, mBlank2 = 230, mIcePillar = 231, mFrostYeti = 232, mManectricSlave = 233, mTrollHammer = 234, mTrollBomber = 235, mTrollStoner = 236, mTrollKing = 237, //BOSS
    mFlameSpear = 238, mFlameMage = 239, mFlameScythe = 240, mFlameAssassin = 241, mFlameQueen = 242, //BOSS
    mHellKnight1 = 243, mHellKnight2 = 244, mHellKnight3 = 245, mHellKnight4 = 246, mHellLord = 247, //BOSS
    mWaterGuard = 248, mIceGuard = 249, mElementGuard = 250, mDemonGuard = 251, mKingGuard = 252, mSnake10 = 253, mSnake11 = 254, mSnake12 = 255, mSnake13 = 256, mSnake14 = 257, mSnake15 = 258, mSnake16 = 259, mSnake17 = 260, mDeathCrawler = 261, mBurningZombie = 262, mMudZombie = 263, mFrozenZombie = 264, mUndeadWolf = 265, mDemonWolf = 266, mWhiteMammoth = 267, mDarkBeast = 268, mLightBeast = 269, //AI 112
    mBloodBaboon = 270, //AI 112
    mHardenRhino = 271, mAncientBringer = 272, mFightingCat = 273, mFireCat = 274, //AI 44
    mCatWidow = 275, //AI 112
    mStainHammerCat = 276, mBlackHammerCat = 277, mStrayCat = 278, mCatShaman = 279, mJar1 = 280, mJar2 = 281, mSeedingsGeneral = 282, mRestlessJar = 283, mGeneralMeowMeow = 284, //BOSS
    mBunny = 285, mTucson = 286, mTucsonFighter = 287, //AI 44
    mTucsonMage = 288, mTucsonWarrior = 289, mArmadillo = 290, mArmadilloElder = 291, mTucsonEgg = 292, //EFFECT 0/1
    mPlaguedTucson = 293, mSandSnail = 294, mCannibalTentacles = 295, mTucsonGeneral = 296, //BOSS
    mGasToad = 297, mMantis = 298, mSwampWarrior = 299, mAssassinBird = 300, mRhinoWarrior = 301, mRhinoPriest = 302, mElephantMan = 303, mStoneGolem = 304, mEarthGolem = 305, mTreeGuardian = 306, mTreeQueen = 307, mPeacockSpider = 308, mDarkBaboon = 309, //AI 112
    mTwinHeadBeast = 310, //AI 112
    mOmaCannibal = 311, mOmaBlest = 312, mOmaSlasher = 313, mOmaAssassin = 314, mOmaMage = 315, mOmaWitchDoctor = 316, mLightningBead = 317, //Effect 0, AI 149
    mHealingBead = 318, //Effect 1, AI 149
    mPowerUpBead = 319, //Effect 2, AI 14
    mDarkOmaKing = 320, //BOSS
    mCaveStatue = 321, mMandrill = 322, mPlagueCrab = 323, mCreeperPlant = 324, mFloatingWraith = 325, //AI 8
    mArmedPlant = 326, mAvengerPlant = 327, mNadz = 328, mAvengingSpirit = 329, mAvengingWarrior = 330, mAxePlant = 331, mWoodBox = 332, mClawBeast = 333, //AI 8
    mDarkCaptain = 334, //BOSS
    mSackWarrior = 335, mWereTiger = 336, //AI 112
    mKingHydrax = 337, mHydrax = 338, mHornedMage = 339, mBlueSoul = 340, mHornedArcher = 341, mColdArcher = 342, mHornedWarrior = 343, mFloatingRock = 344, mScalyBeast = 345, mHornedSorceror = 346, mBoulderSpirit = 347, mHornedCommander = 348, //BOSS
    mMoonStone = 349, mSunStone = 350, mLightningStone = 351, mTurtlegrass = 352, mManTree = 353, mBear = 354,  //Effect 1, AI 112
    mLeopard = 355, mChieftainArcher = 356, mChieftainSword = 357, //BOSS TODO
    mStoningSpider = 358, //Archer Spell mob (not yet coded)
    mVampireSpider = 359, //Archer Spell mob
    mSpittingToad = 360, //Archer Spell mob
    mSnakeTotem = 361, //Archer Spell mob
    mCharmedSnake = 362, //Archer Spell mob
    mFrozenSoldier = 363, mFrozenFighter = 364, //AI 44
    mFrozenArcher = 365, //AI 8
    mFrozenKnight = 366, mFrozenGolem = 367, mIcePhantom = 368, //TODO - AI needs revisiting (blue explosion and snakes)
    mSnowWolf = 369, mSnowWolfKing = 370, //BOSS
    mWaterDragon = 371, mBlackTortoise = 372, mManticore = 373, //TODO
    mDragonWarrior = 374, //Done (DG)
    mDragonArcher = 375, //TODO - Wind Arrow spell
    mKirin = 376, // Done (jxtulong)
    mGuard3 = 377, mArcherGuard3 = 378, mBunny2 = 379, mFrozenMiner = 380, // Done (jxtulong)
    mFrozenAxeman = 381, // Done (jxtulong)
    mFrozenMagician = 382, // Done (jxtulong)
    mSnowYeti = 383, // Done (jxtulong)
    mIceCrystalSoldier = 384, // Done (jxtulong)
    mDarkWraith = 385, // Done (jxtulong)
    mDarkSpirit = 386, // Use AI 8 (AxeSkeleton)
    mCrystalBeast = 387, mRedOrb = 388, mBlueOrb = 389, mYellowOrb = 390, mGreenOrb = 391, mWhiteOrb = 392, mFatalLotus = 393, mAntCommander = 394, mCargoBoxwithlogo = 395, // Done - Use CargoBox AI.
    mDoe = 396, // TELEPORT = EFFECT 9
    mReindeer = 397, //frames not added
    mAngryReindeer = 398, mCargoBox = 399, // Done - Basically a Pinata.
    mRam1 = 400, mRam2 = 401, mKite = 402, mPurpleFaeFlower = 403, mFurball = 404, mGlacierSnail = 405, mFurbolgWarrior = 406, mFurbolgArcher = 407, mFurbolgCommander = 408, mRedFaeFlower = 409, mFurbolgGuard = 410, mGlacierBeast = 411, mGlacierWarrior = 412, mShardGuardian = 413, mWarriorScroll = 414, // Use AI "HoodedSummonerScrolls" - Info.Effect = 0
    mTaoistScroll = 415, // Use AI "HoodedSummonerScrolls" - Info.Effect = 1
    mWizardScroll = 416, // Use AI "HoodedSummonerScrolls" - Info.Effect = 2
    mAssassinScroll = 417, // Use AI "HoodedSummonerScrolls" - Info.Effect = 3
    mHoodedSummoner = 418, //Summons Scrolls
    mHoodedIceMage = 419, mHoodedPriest = 420, mShardMaiden = 421, mKingKong = 422, mWarBear = 423, mReaperPriest = 424, mReaperWizard = 425, mReaperAssassin = 426, mLivingVines = 427, mBlueMonk = 428, mMutantBeserker = 429, mMutantGuardian = 430, mMutantHighPriest = 431, mMysteriousMage = 432, mFeatheredWolf = 433, mMysteriousAssassin = 434, mMysteriousMonk = 435, mManEatingPlant = 436, mHammerDwarf = 437, mArcherDwarf = 438, mNobleWarrior = 439, mNobleArcher = 440, mNoblePriest = 441, mNobleAssassin = 442,
    mSwain = 443, mRedMutantPlant = 444, mBlueMutantPlant = 445, mUndeadHammerDwarf = 446, mUndeadDwarfArcher = 447, mAncientStoneGolem = 448, mSerpentirian = 449, mButcher = 450, mRiklebites = 451, mFeralTundraFurbolg = 452, mFeralFlameFurbolg = 453, mArcaneTotem = 454, mSpectralWraith = 455, mBabyMagmaDragon = 456, mBloodLord = 457, mSerpentLord = 458, mMirEmperor = 459, mMutantManEatingPlant = 460, mMutantWarg = 461, mGrassElemental = 462, mRockElemental = 463,

    //Special
    mEvilMir = 900, mEvilMirBody = 901, mDragonStatue = 902, mHellBomb1 = 903, mHellBomb2 = 904, mHellBomb3 = 905,

    //Siege
    mCatapult = 940, mChariotBallista = 941, mBallista = 942, mTrebuchet = 943, mCanonTrebuchet = 944,

    //Gates
    mSabukGate = 950, mPalaceWallLeft = 951, mPalaceWall1 = 952, mPalaceWall2 = 953, mGiGateSouth = 954, mGiGateEast = 955, mGiGateWest = 956, mSSabukWall1 = 957, mSSabukWall2 = 958, mSSabukWall3 = 959, mNammandGate1 = 960, //Not Coded
    mNammandGate2 = 961, //Not Coded
    mSabukWallSection = 962, //Not Coded
    mNammandWallSection = 963, //Not Coded
    mFrozenDoor = 964, //Not Coded

    //Flags 1000 ~ 1100

    //Creatures
    mBabyPig = 10000, //Permanent
    mChick = 10001, //Special
    mKitten = 10002, //Permanent
    mBabySkeleton = 10003, //Special
    mBaekdon = 10004, //Special
    mWimaen = 10005, //Event
    mBlackKitten = 10006, //unknown
    mBabyDragon = 10007, //unknown
    mOlympicFlame = 10008, //unknown
    mBabySnowMan = 10009, //unknown
    mFrog = 10010, //unknown
    mBabyMonkey = 10011, //unknown
    mAngryBird = 10012, mFoxey = 10013, mMedicalRat = 10014);

  TMirAction = (maStanding, maWalking, maRunning, maPushed, maDashL, maDashR, maDashFail, maStance, maStance2, maAttack1, maAttack2, maAttack3, maAttack4, maAttack5, maAttackRange1, maAttackRange2, maAttackRange3, maSpecial, maStruck, maHarvest, maSpell, maDie, maDead, maSkeleton, maShow, maHide, maStoned, maAppear, maRevive, maSitDown, maMine, maSneek, maDashAttack, maLunge, maWalkingBow, maRunningBow, maJump, maMountStanding, maMountWalking, maMountRunning, maMountStruck, maMountAttack, maFishingCast, maFishingWait, maFishingReel);

  TCellAttribute = (caWalk = 0, caHighWall = 1, caLowWall = 2);

  TLightSetting = (lsNormal = 0, lsDawn = 1, lsDay = 2, lsEvening = 3, lsNight = 4);

  TMirGender = (mgMale = 0, mgFemale = 1);

  TMirClass = (mcWarrior = 0, mcWizard = 1, mcTaoist = 2, mcAssassin = 3, mcArcher = 4);

  TMirDirection = (mdUp = 0, mdUpRight = 1, mdRight = 2, mdDownRight = 3, mdDown = 4, mdDownLeft = 5, mdLeft = 6, mdUpLeft = 7);

  TObjectType = (otNone = 0, otPlayer = 1, otItem = 2, otMerchant = 3, otSpell = 4, otMonster = 5, otDeco = 6, otCreature = 7, otHero = 8);

  TChatType = (ctNormal = 0, ctShout = 1, ctSystem = 2, ctHint = 3, ctAnnouncement = 4, ctGroup = 5, ctWhisperIn = 6, ctWhisperOut = 7, ctGuild = 8, ctTrainer = 9, ctLevelUp = 10, ctSystem2 = 11, ctRelationship = 12, ctMentor = 13, ctShout2 = 14, ctShout3 = 15, ctLineMessage = 16);

  TItemType = (itNothing = 0, itWeapon = 1, itArmour = 2, itHelmet = 4, itNecklace = 5, itBracelet = 6, itRing = 7, itAmulet = 8, itBelt = 9, itBoots = 10, itStone = 11, itTorch = 12, itPotion = 13, itOre = 14, itMeat = 15, itCraftingMaterial = 16, itScroll = 17, itGem = 18, itMount = 19, itBook = 20, itScript = 21, itReins = 22, itBells = 23, itSaddle = 24, itRibbon = 25, itMask = 26, itFood = 27, itHook = 28, itFloat = 29, itBait = 30, itFinder = 31, itReel = 32, itFish = 33, itQuest = 34, itAwakening = 35, itPets = 36, itTransform = 37, itDeco = 38, itSocket = 39, itMonsterSpawn = 40, itSiegeAmmo = 41, itSealedHero = 42);

  TMirGridType = (mgtNone = 0, mgtInventory = 1, mgtEquipment = 2, mgtTrade = 3, mgtStorage = 4, mgtBuyBack = 5, mgtDropPanel = 6, mgtInspect = 7, mgtTrustMerchant = 8, mgtGuildStorage = 9, mgtGuestTrade = 10, mgtMount = 11, mgtFishing = 12, mgtQuestInventory = 13, mgtAwakenItem = 14, mgtMail = 15, mgtRefine = 16, mgtRenting = 17, mgtGuestRenting = 18, mgtCraft = 19, mgtSocket = 20, mgtHeroEquipment = 21, mgtHeroInventory = 22, mgtHeroHPItem = 23, mgtHeroMPItem = 24);

  TEquipmentSlot = (esWeapon = 0, esArmour = 1, esHelmet = 2, esTorch = 3, esNecklace = 4, esBraceletL = 5, esBraceletR = 6, esRingL = 7, esRingR = 8, esAmulet = 9, esBelt = 10, esBoots = 11, esStone = 12, esMount = 13);

  TMountSlot = (msReins = 0, msBells = 1, msSaddle = 2, msRibbon = 3, msMask = 4);

  TFishingSlot = (fsHook = 0, fsFloat = 1, fsBait = 2, fsFinder = 3, fsReel = 4);

  TAttackMode = (amPeace = 0, amGroup = 1, amGuild = 2, amEnemyGuild = 3, amRedBrown = 4, amAll = 5);

  TPetMode = (pmBoth = 0, pmMoveOnly = 1, pmAttackOnly = 2, pmNone = 3);
  //[Flags]

  TPoisonType = (ptNone = 0, ptGreen = 1, ptRed = 2, ptSlow = 4, ptFrozen = 8, ptStun = 16, ptParalysis = 32, ptDelayedExplosion = 64, ptBleeding = 128, ptLRParalysis = 256, ptBlindness = 512, ptDazed = 1024);
  //[Flags]

  TBindMode = (bimNone = 0, bimDontDeathdrop = 1, //0x0001
    bimDontDrop = 2, //0x0002
    bimDontSell = 4, //0x0004
    bimDontStore = 8, //0x0008
    bimDontTrade = 16, //0x0010
    bimDontRepair = 32, //0x0020
    bimDontUpgrade = 64, //0x0040
    bimDestroyOnDrop = 128, //0x0080
    bimBreakOnDeath = 256, //0x0100
    bimBindOnEquip = 512, //0x0200
    bimNoSRepair = 1024, //0x0400
    bimNoWeddingRing = 2048, //0x0800
    bimUnableToRent = 4096, bmUnableToDisassemble = 8192, bmNoMail = 16384, bmNoHero = -32768);
  //[Flags]

  TSpecialItemMode = (simNone = 0, simParalize = $0001, simTeleport = $0002, simClearRing = $0004, simProtection = $0008, simRevival = $0010, simMuscle = $0020, simFlame = $0040, simHealing = $0080, simProbe = $0100, simSkill = $0200, simNoDuraLoss = $0400, simBlink = $0800);
  //[Flags]

  TRequiredClass = (rcWarrior = $01, rcWizard = $02, rcTaoist = $04, rcAssassin = $08, rcArcher = $10, rcWarWizTao = rcWarrior or rcWizard or rcTaoist, rcNone = rcWarWizTao or rcAssassin or rcArcher);
  //[Flags]

  TRequiredGender = (rgMale = 1, rgFemale = 2, rgNone = rgMale or rgFemale);

  TRequiredType = (rtLevel = 0, rtMaxAC = 1, rtMaxMAC = 2, rtMaxDC = 3, rtMaxMC = 4, rtMaxSC = 5, rtMaxLevel = 6, rtMinAC = 7, rtMinMAC = 8, rtMinDC = 9, rtMinMC = 10, rtMinSC = 11);

  TItemSet = (isNone = 0, isSpirit = 1, isRecall = 2, isRedOrchid = 3, isRedFlower = 4, isSmash = 5, isHwanDevil = 6, isPurity = 7, isFiveString = 8, isMundane = 9, isNokChi = 10, isTaoProtect = 11, isMir = 12, isBone = 13, isBug = 14, isWhiteGold = 15, isWhiteGoldH = 16, isRedJade = 17, isRedJadeH = 18, isNephrite = 19, isNephriteH = 20, isWhisker1 = 21, isWhisker2 = 22, isWhisker3 = 23, isWhisker4 = 24, isWhisker5 = 25, isHyeolryong = 26, isMonitor = 27, isOppressive = 28, isPaeok = 29, isSulgwan = 30, isBlueFrost = 31, isDarkGhost = 38, isBlueFrostH = 39);

  TSpell = (spNone = 0,

    //Warrior
    spFencing = 1, spSlaying = 2, spThrusting = 3, spHalfMoon = 4, spShoulderDash = 5, spTwinDrakeBlade = 6, spEntrapment = 7, spFlamingSword = 8, spLionRoar = 9, spCrossHalfMoon = 10, spBladeAvalanche = 11, spProtectionField = 12, spRage = 13, spCounterAttack = 14, spSlashingBurst = 15, spFury = 16, spImmortalSkin = 17,

    //Wizard
    spFireBall = 31, spRepulsion = 32, spElectricShock = 33, spGreatFireBall = 34, spHellFire = 35, spThunderBolt = 36, spTeleport = 37, spFireBang = 38, spFireWall = 39, spLightning = 40, spFrostCrunch = 41, spThunderStorm = 42, spMagicShield = 43, spTurnUndead = 44, spVampirism = 45, spIceStorm = 46, spFlameDisruptor = 47, spMirroring = 48, spFlameField = 49, spBlizzard = 50, spMagicBooster = 51, spMeteorStrike = 52, spIceThrust = 53, spFastMove = 54, spStormEscape = 55,

    //Taoist
    spHealing = 61, spSpiritSword = 62, spPoisoning = 63, spSoulFireBall = 64, spSummonSkeleton = 65, spHiding = 67, spMassHiding = 68, spSoulShield = 69, spRevelation = 70, spBlessedArmour = 71, spEnergyRepulsor = 72, spTrapHexagon = 73, spPurification = 74, spMassHealing = 75, spHallucination = 76, spUltimateEnhancer = 77, spSummonShinsu = 78, spReincarnation = 79, spSummonHolyDeva = 80, spCurse = 81, spPlague = 82, spPoisonCloud = 83, spEnergyShield = 84, spPetEnhancer = 85, spHealingCircle = 86,

    //Assassin
    spFatalSword = 91, spDoubleSlash = 92, spHaste = 93, spFlashDash = 94, spLightBody = 95, spHeavenlySword = 96, spFireBurst = 97, spTrap = 98, spPoisonSword = 99, spMoonLight = 100, spMPEater = 101, spSwiftFeet = 102, spDarkBody = 103, spHemorrhage = 104, spCrescentSlash = 105, spMoonMist = 106,

    //Archer
    spFocus = 121, spStraightShot = 122, spDoubleShot = 123, spExplosiveTrap = 124, spDelayedExplosion = 125, spMeditation = 126, spBackStep = 127, spElementalShot = 128, spConcentration = 129, spStonetrap = 130, spElementalBarrier = 131, spSummonVampire = 132, spVampireShot = 133, spSummonToad = 134, spPoisonShot = 135, spCrippleShot = 136, spSummonSnakes = 137, spNapalmShot = 138, spOneWithNature = 139, spBindingShot = 140, spMentalState = 141,

    //Custom
    spBlink = 151, spPortal = 152, spBattleCry = 153, spFireBounce = 154, spMeteorShower = 155,

    //Map Events
    spDigOutZombie = 200, spRubble = 201, spMapLightning = 202, spMapLava = 203, spMapQuake1 = 204, spMapQuake2 = 205, spDigOutArmadillo = 206, spGeneralMeowMeowThunder = 207, spStoneGolemQuake = 208, spEarthGolemPile = 209, spTreeQueenRoot = 210, spTreeQueenMassRoots = 211, spTreeQueenGroundRoots = 212, spTucsonGeneralRock = 213, spFlyingStatueIceTornado = 214, spDarkOmaKingNuke = 215, spHornedSorcererDustTornado = 216, spHornedCommanderRockFall = 217, spHornedCommanderRockSpike = 218, spShardMaidenIceBlock = 219, spRiklebitesLaser = 220);

  TSpellEffect = (seNone, seFatalSword, seTeleport, seHealing, seRedMoonEvil, seTwinDrakeBlade, seMagicShieldUp, seMagicShieldDown, seGreatFoxSpirit, seEntrapment, seReflect, seCritical, seMine, seElementalBarrierUp, seElementalBarrierDown, seDelayedExplosion, seMPEater, seHemorrhage, seBleeding, seAwakeningSuccess, seAwakeningFail, seAwakeningMiss, seAwakeningHit, seStormEscape, seTurtleKing, seBehemoth, seStunned, seIcePillar, seKingGuard, seKingGuard2, seDeathCrawlerBreath, seFlamingMutantWeb, seFurbolgWarriorCritical, seTester);

  TBuffType = (btNone, btTemporalFlux, btHiding, btHaste, btSwiftFeet, btFury, btSoulShield, btBlessedArmour, btLightBody, btUltimateEnhancer, btProtectionField, btRage, btCurse, btMoonLight, btDarkBody, btConcentration, btVampireShot, btPoisonShot, btCounterAttack, btMentalState, btEnergyShield, btMagicBooster, btPetEnhancer, btImmortalSkin, btMagicShield, btElementalBarrier, btHornedArcherBuff = 50, btColdArcherBuff, btGeneralMeowMeowShield, btRhinoPriestDebuff, btPowerBeadBuff, btHornedWarriorShield,
    btHornedCommanderShield, btBlindness, btRiklebitesLazer, btGameMaster = 100, btGeneral, btExp, btDrop, btGold, btBagWeight, btTransform, btLover, btMentee, btMentor, btGuild, btPrison, btRested, btSkill, btClearRing, btImpact = 200, btMagic, btTaoist, btStorm, btHealthAid, btManaAid, btDefence, btMagicDefence, btWonderDrug, btKnapsack);

  TBuffProperty = (bpNone, bpRemoveOnDeath, bpRemoveOnExit, bpDebuff, bpPauseInSafeZone);

  TBuffProperties = set of TBuffProperty;

  TBuffStackType = (bstNone, bstResetDuration, bstStackDuration, bstStackStat, bstStackStatAndDuration, bstInfinite, bstResetStat, bstResetStatAndDuration);

  TDefenceType = (dtACAgility, dtAC, dtMACAgility, dtMAC, dtAgility, dtRepulsion, dtNone);

  TServerPacketIds = (spConnected, spClientVersion, spDisconnect, spKeepAlive, spNewAccount, spChangePassword, spChangePasswordBanned, spLogin, spLoginBanned, spLoginSuccess, spNewCharacter, spNewCharacterSuccess, spDeleteCharacter, spDeleteCharacterSuccess, spStartGame, spStartGameBanned, spStartGameDelay, spMapInformation, spNewMapInfo, spWorldMapSetup, spSearchMapResult, spUserInformation, spUserSlotsRefresh, spUserLocation, spObjectPlayer, spObjectHero, spObjectRemove, spObjectTurn, spObjectWalk,
    spObjectRun, spChat, spObjectChat, spNewItemInfo, spNewHeroInfo, spNewChatItem, spMoveItem, spEquipItem, spMergeItem, spRemoveItem, spRemoveSlotItem, spTakeBackItem, spStoreItem, spSplitItem, spSplitItem1, spDepositRefineItem, spRetrieveRefineItem, spRefineCancel, spRefineItem, spDepositTradeItem, spRetrieveTradeItem, spUseItem, spDropItem, spTakeBackHeroItem, spTransferHeroItem, spPlayerUpdate, spPlayerInspect, spLogOutSuccess, spLogOutFailed, spReturnToLogin, spTimeOfDay, spChangeAMode, spChangePMode,
    spObjectItem, spObjectGold, spGainedItem, spGainedGold, spLoseGold, spGainedCredit, spLoseCredit, spObjectMonster, spObjectAttack, spStruck, spObjectStruck, spDamageIndicator, spDuraChanged, spHealthChanged, spHeroHealthChanged, spDeleteItem, spDeath, spObjectDied, spColourChanged, spObjectColourChanged, spObjectGuildNameChanged, spGainExperience, spGainHeroExperience, spLevelChanged, spHeroLevelChanged, spObjectLeveled, spObjectHarvest, spObjectHarvested, spObjectNpc, spNPCResponse, spObjectHide,
    spObjectShow, spPoisoned, spObjectPoisoned, spMapChanged, spObjectTeleportOut, spObjectTeleportIn, spTeleportIn, spNPCGoods, spNPCSell, spNPCRepair, spNPCSRepair, spNPCRefine, spNPCCheckRefine, spNPCCollectRefine, spNPCReplaceWedRing, spNPCStorage, spSellItem, spCraftItem, spRepairItem, spItemRepaired, spItemSlotSizeChanged, spItemSealChanged, spNewMagic, spRemoveMagic, spMagicLeveled, spMagic, spMagicDelay, spMagicCast, spObjectMagic, spObjectEffect, spObjectProjectile, spRangeAttack, spPushed,
    spObjectPushed, spObjectName, spUserStorage, spSwitchGroup, spDeleteGroup, spDeleteMember, spGroupInvite, spAddMember, spRevived, spObjectRevived, spSpellToggle, spObjectHealth, spObjectMana, spMapEffect, spAllowObserve, spObjectRangeAttack, spAddBuff, spRemoveBuff, spPauseBuff, spObjectHidden, spRefreshItem, spObjectSpell, spUserDash, spObjectDash, spUserDashFail, spObjectDashFail, spNPCConsign, spNPCMarket, spNPCMarketPage, spConsignItem, spMarketFail, spMarketSuccess, spObjectSitDown, spInTrapRock,
    spBaseStatsInfo, spHeroBaseStatsInfo, spUserName, spChatItemStats, spGuildNoticeChange, spGuildMemberChange, spGuildStatus, spGuildInvite, spGuildExpGain, spGuildNameRequest, spGuildStorageGoldChange, spGuildStorageItemChange, spGuildStorageList, spGuildRequestWar, spHeroCreateRequest, spNewHero, spHeroInformation, spUpdateHeroSpawnState, spUnlockHeroAutoPot, spSetAutoPotValue, spSetAutoPotItem, spSetHeroBehaviour, spManageHeroes, spChangeHero, spDefaultNPC, spNPCUpdate, spNPCImageUpdate,
    spMarriageRequest, spDivorceRequest, spMentorRequest, spTradeRequest, spTradeAccept, spTradeGold, spTradeItem, spTradeConfirm, spTradeCancel, spMountUpdate, spEquipSlotItem, spFishingUpdate, spChangeQuest, spCompleteQuest, spShareQuest, spNewQuestInfo, spGainedQuestItem, spDeleteQuestItem, spCancelReincarnation, spRequestReincarnation, spUserBackStep, spObjectBackStep, spUserDashAttack, spObjectDashAttack, spUserAttackMove, spCombineItem, spItemUpgraded, spSetConcentration, spSetElemental,
    spRemoveDelayedExplosion, spObjectDeco, spObjectSneaking, spObjectLevelEffects, spSetBindingShot, spSendOutputMessage, spNPCAwakening, spNPCDisassemble, spNPCDowngrade, spNPCReset, spAwakeningNeedMaterials, spAwakeningLockedItem, spAwakening, spReceiveMail, spMailLockedItem, spMailSendRequest, spMailSent, spParcelCollected, spMailCost, spResizeInventory, spResizeStorage, spNewIntelligentCreature, spUpdateIntelligentCreatureList, spIntelligentCreatureEnableRename, spIntelligentCreaturePickup,
    spNPCPearlGoods, spTransformUpdate, spFriendUpdate, spLoverUpdate, spMentorUpdate, spGuildBuffList, spNPCRequestInput, spGameShopInfo, spGameShopStock, spRankings, spOpendoor, spGetRentedItems, spItemRentalRequest, spItemRentalFee, spItemRentalPeriod, spDepositRentalItem, spRetrieveRentalItem, spUpdateRentalItem, spCancelItemRental, spItemRentalLock, spItemRentalPartnerLock, spCanConfirmItemRental, spConfirmItemRental, spNewRecipeInfo, spOpenBrowser, spPlaySound, spSetTimer, spExpireTimer, spUpdateNotice, spRoll, spSetCompass, spGroupMembersMap, spSendMemberLocation);

  TClientPacketIds = (cpClientVersion, cpDisconnect, cpKeepAlive, cpNewAccount, cpChangePassword, cpLogin, cpNewCharacter, cpDeleteCharacter, cpStartGame, cpLogOut, cpTurn, cpWalk, cpRun, cpChat, cpMoveItem, cpStoreItem, cpTakeBackItem, cpMergeItem, cpEquipItem, cpRemoveItem, cpRemoveSlotItem, cpSplitItem, cpUseItem, cpDropItem, cpDepositRefineItem, cpRetrieveRefineItem, cpRefineCancel, cpRefineItem, cpCheckRefine, cpReplaceWedRing, cpDepositTradeItem, cpRetrieveTradeItem, cpTakeBackHeroItem,
    cpTransferHeroItem, cpDropGold, cpPickUp, cpRequestMapInfo, cpTeleportToNPC, cpSearchMap, cpInspect, cpObserve, cpChangeAMode, cpChangePMode, cpChangeTrade, cpAttack, cpRangeAttack, cpHarvest, cpCallNPC, cpBuyItem, cpSellItem, cpCraftItem, cpRepairItem, cpBuyItemBack, cpSRepairItem, cpMagicKey, cpMagic, cpSwitchGroup, cpAddMember, cpDellMember, cpGroupInvite, cpNewHero, cpSetAutoPotValue, cpSetAutoPotItem, cpSetHeroBehaviour, cpChangeHero, cpTownRevive, cpSpellToggle, cpConsignItem, cpMarketSearch,
    cpMarketRefresh, cpMarketPage, cpMarketBuy, cpMarketGetBack, cpMarketSellNow, cpRequestUserName, cpRequestChatItem, cpEditGuildMember, cpEditGuildNotice, cpGuildInvite, cpGuildNameReturn, cpRequestGuildInfo, cpGuildStorageGoldChange, cpGuildStorageItemChange, cpGuildWarReturn, cpMarriageRequest, cpMarriageReply, cpChangeMarriage, cpDivorceRequest, cpDivorceReply, cpAddMentor, cpMentorReply, cpAllowMentor, cpCancelMentor, cpTradeRequest, cpTradeReply, cpTradeGold, cpTradeConfirm, cpTradeCancel,
    cpEquipSlotItem, cpFishingCast, cpFishingChangeAutocast, cpAcceptQuest, cpFinishQuest, cpAbandonQuest, cpShareQuest, cpAcceptReincarnation, cpCancelReincarnation, cpCombineItem, cpAwakeningNeedMaterials, cpAwakeningLockedItem, cpAwakening, cpDisassembleItem, cpDowngradeAwakening, cpResetAddedItem, cpSendMail, cpReadMail, cpCollectParcel, cpDeleteMail, cpLockMail, cpMailLockedItem, cpMailCost, cpUpdateIntelligentCreature, cpIntelligentCreaturePickup, cpRequestIntelligentCreatureUpdates, cpAddFriend,
    cpRemoveFriend, cpRefreshFriends, cpAddMemo, cpGuildBuffUpdate, cpNPCConfirmInput, cpGameshopBuy, cpReportIssue, cpGetRanking, cpOpendoor, cpGetRentedItems, cpItemRentalRequest, cpItemRentalFee, cpItemRentalPeriod, cpDepositRentalItem, cpRetrieveRentalItem, cpCancelItemRental, cpItemRentalLockFee, cpItemRentalLockItem, cpConfirmItemRental);

  TConquestType = (ctRequest, ctAuto, ctForced);

  TConquestGame = (cgCapturePalace, cgKingOfHill, cgRandom, cgClassic, cgControlPoints);

  TGuildRankOption = (groCanChangeRank, groCanRecruit, groCanKick, groCanStoreItem, groCanRetrieveItem, groCanAlterAlliance, groCanChangeNotice, groCanActivateBuff);

  TGuildRankOptions = set of TGuildRankOption;

  TDoorState = (dsClosed, dsOpening, dsOpen, dsClosing);

  TIntelligentCreaturePickupMode = (icAutomatic, icSemiAutomatic);

  THeroSpawnState = (hsNone, hsUnsummoned, hsSummoned, hsDead);

  THeroBehaviour = (hbAttack, hbCounterAttack, hbFollow, hbCustom);

  TSpellToggleState = (stsNone = -1, stsFalse = 0, stsTrue = 1);

implementation

end.

