unit Packet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes;

type
  TPacket = class
  protected
    procedure ReadPacket(reader: TBinaryReader); virtual; abstract;
    procedure WritePacket(writer: TBinaryWriter); virtual; abstract;
  public
    Observable: Boolean;
    constructor Create; virtual;
    destructor Destroy; virtual;
    function GetPacketBytes(): TBytes;
    function GetIndex(): SmallInt; virtual;
  end;

function ReceivePacket(rawBytes: TBytes; out extra: TBytes): TPacket;

function GetClientPacket(Index: SmallInt): TPacket;

function GetServerPacket(Index: SmallInt): TPacket;

var
  IsServer: Boolean;

implementation

uses
  Enum, ServerPackets;

function ReceivePacket(rawBytes: TBytes; out extra: TBytes): TPacket;
var
  nLen, id: Smallint;
begin
  extra := rawBytes;
  if Length(rawBytes) < 4 then
  begin
    Result := nil;
    Exit;
  end;

  nLen := (rawBytes[1] shl 8) + rawBytes[0];
  if (nLen > Length(rawBytes)) or (nLen < 2) then
  begin
    Result := nil;
    Exit;
  end;

  var ms := TMemoryStream.Create;
  try
    ms.Write(rawBytes[2], nLen - 2);
    ms.Position := 0;
    var reader := TBinaryReader.Create(ms);
    try
      id := reader.ReadInt16;
      if IsServer then
        Result := GetClientPacket(id)
      else
        Result := GetServerPacket(id);

      if Result = nil then
      begin
        Exit;
      end;

      Result.ReadPacket(reader);
    finally
      reader.Free;
    end;
  finally
    ms.Free;
  end;

  SetLength(extra, Length(rawBytes) - nLen);
  System.Move(rawBytes[nLen], extra[0], Length(rawBytes) - nLen);
end;

constructor TPacket.Create;
begin

end;

destructor TPacket.Destroy;
begin

end;


function TPacket.GetIndex: SmallInt;
begin

end;

function TPacket.GetPacketBytes: TBytes;
var
  ms: TMemoryStream;
  writer: TBinaryWriter;
  data: TBytes;
begin
  if GetIndex < 0 then
  begin
    SetLength(Result, 0);
    Exit;
  end;

  ms := TMemoryStream.Create;
  try
    ms.SetSize(2);
    ms.Position := 2;
    writer := TBinaryWriter.Create(ms);
    try
      writer.Write(GetIndex);
      WritePacket(writer);
      ms.Position := 0;
      writer.Write(SmallInt(ms.Size));
      ms.Position := 0;

      SetLength(data, ms.Size);
      ms.Read(data[0], ms.Size);
    finally
      writer.Free;
    end;
  finally
    ms.Free;
  end;

  Result := data;
end;

function GetClientPacket(Index: SmallInt): TPacket;
begin

end;

function GetServerPacket(Index: SmallInt): TPacket;
begin
  case TServerPacketIds(Index) of
    spConnected:
      Result := TSConnected.Create();
//    spClientVersion:
//      Result := TSClientVersion.Create();
//    spDisconnect:
//      Result := TSDisconnect.Create();
//    spKeepAlive:
//      Result := TSKeepAlive.Create();
//    spNewAccount:
//      Result := TSNewAccount.Create();
//    spChangePassword:
//      Result := TSChangePassword.Create();
//    spChangePasswordBanned:
//      Result := TSChangePasswordBanned.Create();
//    spLogin:
//      Result := TSLogin.Create();
//    spLoginBanned:
//      Result := TSLoginBanned.Create();
//    spLoginSuccess:
//      Result := TSLoginSuccess.Create();
//    spNewCharacter:
//      Result := TSNewCharacter.Create();
//    spNewCharacterSuccess:
//      Result := TSNewCharacterSuccess.Create();
//    spDeleteCharacter:
//      Result := TSDeleteCharacter.Create();
//    spDeleteCharacterSuccess:
//      Result := TSDeleteCharacterSuccess.Create();
//    spStartGame:
//      Result := TSStartGame.Create();
//    spStartGameBanned:
//      Result := TSStartGameBanned.Create();
//    spStartGameDelay:
//      Result := TSStartGameDelay.Create();
//    spMapInformation:
//      Result := TSMapInformation.Create();
//    spNewMapInfo:
//      Result := TSNewMapInfo.Create();
//    spWorldMapSetup:
//      Result := TSWorldMapSetupInfo.Create();
//    spSearchMapResult:
//      Result := TSSearchMapResult.Create();
//    spUserInformation:
//      Result := TSUserInformation.Create();
//    spUserSlotsRefresh:
//      Result := TSUserSlotsRefresh.Create();
//    spUserLocation:
//      Result := TSUserLocation.Create();
//    spObjectPlayer:
//      Result := TSObjectPlayer.Create();
//    spObjectHero:
//      Result := TSObjectHero.Create();
//    spObjectRemove:
//      Result := TSObjectRemove.Create();
//    spObjectTurn:
//      Result := TSObjectTurn.Create();
//    spObjectWalk:
//      Result := TSObjectWalk.Create();
//    spObjectRun:
//      Result := TSObjectRun.Create();
//    spChat:
//      Result := TSChat.Create();
//    spObjectChat:
//      Result := TSObjectChat.Create();
//    spNewItemInfo:
//      Result := TSNewItemInfo.Create();
//    spNewHeroInfo:
//      Result := TSNewHeroInfo.Create();
//    spNewChatItem:
//      Result := TSNewChatItem.Create();
//    spMoveItem:
//      Result := TSMoveItem.Create();
//    spEquipItem:
//      Result := TSEquipItem.Create();
//    spMergeItem:
//      Result := TSMergeItem.Create();
//    spRemoveItem:
//      Result := TSRemoveItem.Create();
//    spRemoveSlotItem:
//      Result := TSRemoveSlotItem.Create();
//    spTakeBackItem:
//      Result := TSTakeBackItem.Create();
//    spTakeBackHeroItem:
//      Result := TSTakeBackHeroItem.Create();
//    spTransferHeroItem:
//      Result := TSTransferHeroItem.Create();
//    spStoreItem:
//      Result := TSStoreItem.Create();
//    spDepositRefineItem:
//      Result := TSDepositRefineItem.Create();
//    spRetrieveRefineItem:
//      Result := TSRetrieveRefineItem.Create();
//    spRefineItem:
//      Result := TSRefineItem.Create();
//    spDepositTradeItem:
//      Result := TSDepositTradeItem.Create();
//    spRetrieveTradeItem:
//      Result := TSRetrieveTradeItem.Create();
//    spSplitItem:
//      Result := TSSplitItem.Create();
//    spSplitItem1:
//      Result := TSSplitItem1.Create();
//    spUseItem:
//      Result := TSUseItem.Create();
//    spDropItem:
//      Result := TSDropItem.Create();
//    spPlayerUpdate:
//      Result := TSPlayerUpdate.Create();
//    spPlayerInspect:
//      Result := TSPlayerInspect.Create();
//    spLogOutSuccess:
//      Result := TSLogOutSuccess.Create();
//    spLogOutFailed:
//      Result := TSLogOutFailed.Create();
//    spReturnToLogin:
//      Result := TSReturnToLogin.Create();
//    spTimeOfDay:
//      Result := TSTimeOfDay.Create();
//    spChangeAMode:
//      Result := TSChangeAMode.Create();
//    spChangePMode:
//      Result := TSChangePMode.Create();
//    spObjectItem:
//      Result := TSObjectItem.Create();
//    spObjectGold:
//      Result := TSObjectGold.Create();
//    spGainedItem:
//      Result := TSGainedItem.Create();
//    spGainedGold:
//      Result := TSGainedGold.Create();
//    spLoseGold:
//      Result := TSLoseGold.Create();
//    spGainedCredit:
//      Result := TSGainedCredit.Create();
//    spLoseCredit:
//      Result := TSLoseCredit.Create();
//    spObjectMonster:
//      Result := TSObjectMonster.Create();
//    spObjectAttack:
//      Result := TSObjectAttack.Create();
//    spStruck:
//      Result := TSStruck.Create();
//    spDamageIndicator:
//      Result := TSDamageIndicator.Create();
//    spObjectStruck:
//      Result := TSObjectStruck.Create();
//    spDuraChanged:
//      Result := TSDuraChanged.Create();
//    spHealthChanged:
//      Result := TSHealthChanged.Create();
//    spHeroHealthChanged:
//      Result := TSHeroHealthChanged.Create();
//    spDeleteItem:
//      Result := TSDeleteItem.Create();
//    spDeath:
//      Result := TSDeath.Create();
//    spObjectDied:
//      Result := TSObjectDied.Create();
//    spColourChanged:
//      Result := TSColourChanged.Create();
//    spObjectColourChanged:
//      Result := TSObjectColourChanged.Create();
//    spObjectGuildNameChanged:
//      Result := TSObjectGuildNameChanged.Create();
//    spGainExperience:
//      Result := TSGainExperience.Create();
//    spGainHeroExperience:
//      Result := TSGainHeroExperience.Create();
//    spLevelChanged:
//      Result := TSLevelChanged.Create();
//    spHeroLevelChanged:
//      Result := TSHeroLevelChanged.Create();
//    spObjectLeveled:
//      Result := TSObjectLeveled.Create();
//    spObjectHarvest:
//      Result := TSObjectHarvest.Create();
//    spObjectHarvested:
//      Result := TSObjectHarvested.Create();
//    spObjectNpc:
//      Result := TSObjectNPC.Create();
//    spNPCResponse:
//      Result := TSNPCResponse.Create();
//    spObjectHide:
//      Result := TSObjectHide.Create();
//    spObjectShow:
//      Result := TSObjectShow.Create();
//    spPoisoned:
//      Result := TSPoisoned.Create();
//    spObjectPoisoned:
//      Result := TSObjectPoisoned.Create();
//    spMapChanged:
//      Result := TSMapChanged.Create();
//    spObjectTeleportOut:
//      Result := TSObjectTeleportOut.Create();
//    spObjectTeleportIn:
//      Result := TSObjectTeleportIn.Create();
//    spTeleportIn:
//      Result := TSTeleportIn.Create();
//    spNPCGoods:
//      Result := TSNPCGoods.Create();
//    spNPCSell:
//      Result := TSNPCSell.Create();
//    spNPCRepair:
//      Result := TSNPCRepair.Create();
//    spNPCSRepair:
//      Result := TSNPCSRepair.Create();
//    spNPCRefine:
//      Result := TSNPCRefine.Create();
//    spNPCCheckRefine:
//      Result := TSNPCCheckRefine.Create();
//    spNPCCollectRefine:
//      Result := TSNPCCollectRefine.Create();
//    spNPCReplaceWedRing:
//      Result := TSNPCReplaceWedRing.Create();
//    spNPCStorage:
//      Result := TSNPCStorage.Create();
//    spSellItem:
//      Result := TSSellItem.Create();
//    spCraftItem:
//      Result := TSCraftItem.Create();
//    spRepairItem:
//      Result := TSRepairItem.Create();
//    spItemRepaired:
//      Result := TSItemRepaired.Create();
//    spItemSlotSizeChanged:
//      Result := TSItemSlotSizeChanged.Create();
//    spItemSealChanged:
//      Result := TSItemSealChanged.Create();
//    spNewMagic:
//      Result := TSNewMagic.Create();
//    spMagicLeveled:
//      Result := TSMagicLeveled.Create();
//    spMagic:
//      Result := TSMagic.Create();
//    spMagicDelay:
//      Result := TSMagicDelay.Create();
//    spMagicCast:
//      Result := TSMagicCast.Create();
//    spObjectMagic:
//      Result := TSObjectMagic.Create();
//    spObjectProjectile:
//      Result := TSObjectProjectile.Create();
//    spObjectEffect:
//      Result := TSObjectEffect.Create();
//    spRangeAttack:
//      Result := TSRangeAttack.Create();
//    spPushed:
//      Result := TSPushed.Create();
//    spObjectPushed:
//      Result := TSObjectPushed.Create();
//    spObjectName:
//      Result := TSObjectName.Create();
//    spUserStorage:
//      Result := TSUserStorage.Create();
//    spSwitchGroup:
//      Result := TSSwitchGroup.Create();
//    spDeleteGroup:
//      Result := TSDeleteGroup.Create();
//    spDeleteMember:
//      Result := TSDeleteMember.Create();
//    spGroupInvite:
//      Result := TSGroupInvite.Create();
//    spAddMember:
//      Result := TSAddMember.Create();
//    spGroupMembersMap:
//      Result := TSGroupMembersMap.Create();
//    spSendMemberLocation:
//      Result := TSSendMemberLocation.Create();
//    spRevived:
//      Result := TSRevived.Create();
//    spObjectRevived:
//      Result := TSObjectRevived.Create();
//    spSpellToggle:
//      Result := TSSpellToggle.Create();
//    spObjectHealth:
//      Result := TSObjectHealth.Create();
//    spObjectMana:
//      Result := TSObjectMana.Create();
//    spMapEffect:
//      Result := TSMapEffect.Create();
//    spAllowObserve:
//      Result := TSAllowObserve.Create();
//    spObjectRangeAttack:
//      Result := TSObjectRangeAttack.Create();
//    spAddBuff:
//      Result := TSAddBuff.Create();
//    spRemoveBuff:
//      Result := TSRemoveBuff.Create();
//    spPauseBuff:
//      Result := TSPauseBuff.Create();
//    spObjectHidden:
//      Result := TSObjectHidden.Create();
//    spRefreshItem:
//      Result := TSRefreshItem.Create();
//    spObjectSpell:
//      Result := TSObjectSpell.Create();
//    spUserDash:
//      Result := TSUserDash.Create();
//    spObjectDash:
//      Result := TSObjectDash.Create();
//    spUserDashFail:
//      Result := TSUserDashFail.Create();
//    spObjectDashFail:
//      Result := TSObjectDashFail.Create();
//    spNPCConsign:
//      Result := TSNPCConsign.Create();
//    spNPCMarket:
//      Result := TSNPCMarket.Create();
//    spNPCMarketPage:
//      Result := TSNPCMarketPage.Create();
//    spConsignItem:
//      Result := TSConsignItem.Create();
//    spMarketFail:
//      Result := TSMarketFail.Create();
//    spMarketSuccess:
//      Result := TSMarketSuccess.Create();
//    spObjectSitDown:
//      Result := TSObjectSitDown.Create();
//    spInTrapRock:
//      Result := TSInTrapRock.Create();
//    spRemoveMagic:
//      Result := TSRemoveMagic.Create();
//    spBaseStatsInfo:
//      Result := TSBaseStatsInfo.Create();
//    spHeroBaseStatsInfo:
//      Result := TSHeroBaseStatsInfo.Create();
//    spUserName:
//      Result := TSUserName.Create();
//    spChatItemStats:
//      Result := TSChatItemStats.Create();
//    spGuildMemberChange:
//      Result := TSGuildMemberChange.Create();
//    spGuildNoticeChange:
//      Result := TSGuildNoticeChange.Create();
//    spGuildStatus:
//      Result := TSGuildStatus.Create();
//    spGuildInvite:
//      Result := TSGuildInvite.Create();
//    spGuildExpGain:
//      Result := TSGuildExpGain.Create();
//    spGuildNameRequest:
//      Result := TSGuildNameRequest.Create();
//    spGuildStorageGoldChange:
//      Result := TSGuildStorageGoldChange.Create();
//    spGuildStorageItemChange:
//      Result := TSGuildStorageItemChange.Create();
//    spGuildStorageList:
//      Result := TSGuildStorageList.Create();
//    spGuildRequestWar:
//      Result := TSGuildRequestWar.Create();
//    spHeroCreateRequest:
//      Result := TSHeroCreateRequest.Create();
//    spNewHero:
//      Result := TSNewHero.Create();
//    spHeroInformation:
//      Result := TSHeroInformation.Create();
//    spUpdateHeroSpawnState:
//      Result := TSUpdateHeroSpawnState.Create();
//    spUnlockHeroAutoPot:
//      Result := TSUnlockHeroAutoPot.Create();
//    spSetAutoPotValue:
//      Result := TSSetAutoPotValue.Create();
//    spSetAutoPotItem:
//      Result := TSSetAutoPotItem.Create();
//    spSetHeroBehaviour:
//      Result := TSSetHeroBehaviour.Create();
//    spManageHeroes:
//      Result := TSManageHeroes.Create();
//    spChangeHero:
//      Result := TSChangeHero.Create();
//    spDefaultNPC:
//      Result := TSDefaultNPC.Create();
//    spNPCUpdate:
//      Result := TSNPCUpdate.Create();
//    spNPCImageUpdate:
//      Result := TSNPCImageUpdate.Create();
//    spMarriageRequest:
//      Result := TSMarriageRequest.Create();
//    spDivorceRequest:
//      Result := TSDivorceRequest.Create();
//    spMentorRequest:
//      Result := TSMentorRequest.Create();
//    spTradeRequest:
//      Result := TSTradeRequest.Create();
//    spTradeAccept:
//      Result := TSTradeAccept.Create();
//    spTradeGold:
//      Result := TSTradeGold.Create();
//    spTradeItem:
//      Result := TSTradeItem.Create();
//    spTradeConfirm:
//      Result := TSTradeConfirm.Create();
//    spTradeCancel:
//      Result := TSTradeCancel.Create();
//    spMountUpdate:
//      Result := TSMountUpdate.Create();
//    spTransformUpdate:
//      Result := TSTransformUpdate.Create();
//    spEquipSlotItem:
//      Result := TSEquipSlotItem.Create();
//    spFishingUpdate:
//      Result := TSFishingUpdate.Create();
//    spChangeQuest:
//      Result := TSChangeQuest.Create();
//    spCompleteQuest:
//      Result := TSCompleteQuest.Create();
//    spShareQuest:
//      Result := TSShareQuest.Create();
//    spNewQuestInfo:
//      Result := TSNewQuestInfo.Create();
//    spGainedQuestItem:
//      Result := TSGainedQuestItem.Create();
//    spDeleteQuestItem:
//      Result := TSDeleteQuestItem.Create();
//    spCancelReincarnation:
//      Result := TSCancelReincarnation.Create();
//    spRequestReincarnation:
//      Result := TSRequestReincarnation.Create();
//    spUserBackStep:
//      Result := TSUserBackStep.Create();
//    spObjectBackStep:
//      Result := TSObjectBackStep.Create();
//    spUserDashAttack:
//      Result := TSUserDashAttack.Create();
//    spObjectDashAttack:
//      Result := TSObjectDashAttack.Create();
//    spUserAttackMove: //Warrior Skill - SlashingBurst
//      Result := TSUserAttackMove.Create();
//    spCombineItem:
//      Result := TSCombineItem.Create();
//    spItemUpgraded:
//      Result := TSItemUpgraded.Create();
//    spSetConcentration:
//      Result := TSSetConcentration.Create();
//    spSetElemental:
//      Result := TSSetElemental.Create();
//    spRemoveDelayedExplosion:
//      Result := TSRemoveDelayedExplosion.Create();
//    spObjectDeco:
//      Result := TSObjectDeco.Create();
//    spObjectSneaking:
//      Result := TSObjectSneaking.Create();
//    spObjectLevelEffects:
//      Result := TSObjectLevelEffects.Create();
//    spSetBindingShot:
//      Result := TSSetBindingShot.Create();
//    spSendOutputMessage:
//      Result := TSSendOutputMessage.Create();
//    spNPCAwakening:
//      Result := TSNPCAwakening.Create();
//    spNPCDisassemble:
//      Result := TSNPCDisassemble.Create();
//    spNPCDowngrade:
//      Result := TSNPCDowngrade.Create();
//    spNPCReset:
//      Result := TSNPCReset.Create();
//    spAwakeningNeedMaterials:
//      Result := TSAwakeningNeedMaterials.Create();
//    spAwakeningLockedItem:
//      Result := TSAwakeningLockedItem.Create();
//    spAwakening:
//      Result := TSAwakening.Create();
//    spReceiveMail:
//      Result := TSReceiveMail.Create();
//    spMailLockedItem:
//      Result := TSMailLockedItem.Create();
//    spMailSent:
//      Result := TSMailSent.Create();
//    spMailSendRequest:
//      Result := TSMailSendRequest.Create();
//    spParcelCollected:
//      Result := TSParcelCollected.Create();
//    spMailCost:
//      Result := TSMailCost.Create();
//    spResizeInventory:
//      Result := TSResizeInventory.Create();
//    spResizeStorage:
//      Result := TSResizeStorage.Create();
//    spNewIntelligentCreature:
//      Result := TSNewIntelligentCreature.Create();
//    spUpdateIntelligentCreatureList:
//      Result := TSUpdateIntelligentCreatureList.Create();
//    spIntelligentCreatureEnableRename:
//      Result := TSIntelligentCreatureEnableRename.Create();
//    spIntelligentCreaturePickup:
//      Result := TSIntelligentCreaturePickup.Create();
//    spNPCPearlGoods:
//      Result := TSNPCPearlGoods.Create();
//    spFriendUpdate:
//      Result := TSFriendUpdate.Create();
//    spLoverUpdate:
//      Result := TSLoverUpdate.Create();
//    spMentorUpdate:
//      Result := TSMentorUpdate.Create();
//    spGuildBuffList:
//      Result := TSGuildBuffList.Create();
//    spGameShopInfo:
//      Result := TSGameShopInfo.Create();
//    spGameShopStock:
//      Result := TSGameShopStock.Create();
//    spNPCRequestInput:
//      Result := TSNPCRequestInput.Create();
//    spRankings:
//      Result := TSRankings.Create();
//    spOpendoor:
//      Result := TSOpendoor.Create();
//    spGetRentedItems:
//      Result := TSGetRentedItems.Create();
//    spItemRentalRequest:
//      Result := TSItemRentalRequest.Create();
//    spItemRentalFee:
//      Result := TSItemRentalFee.Create();
//    spItemRentalPeriod:
//      Result := TSItemRentalPeriod.Create();
//    spDepositRentalItem:
//      Result := TSDepositRentalItem.Create();
//    spRetrieveRentalItem:
//      Result := TSRetrieveRentalItem.Create();
//    spUpdateRentalItem:
//      Result := TSUpdateRentalItem.Create();
//    spCancelItemRental:
//      Result := TSCancelItemRental.Create();
//    spItemRentalLock:
//      Result := TSItemRentalLock.Create();
//    spItemRentalPartnerLock:
//      Result := TSItemRentalPartnerLock.Create();
//    spCanConfirmItemRental:
//      Result := TSCanConfirmItemRental.Create();
//    spConfirmItemRental:
//      Result := TSConfirmItemRental.Create();
//    spNewRecipeInfo:
//      Result := TSNewRecipeInfo.Create();
//    spOpenBrowser:
//      Result := TSOpenBrowser.Create();
//    spPlaySound:
//      Result := TSPlaySound.Create();
//    spSetTimer:
//      Result := TSSetTimer.Create();
//    spExpireTimer:
//      Result := TSExpireTimer.Create();
//    spUpdateNotice:
//      Result := TSUpdateNotice.Create();
//    spRoll:
//      Result := TSRoll.Create();
//    spSetCompass:
//      Result := TSSetCompass.Create();
  else
      Result := nil;
  end;
end;

end.

