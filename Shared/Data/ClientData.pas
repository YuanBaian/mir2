unit ClientData;

interface

uses
  System.DateUtils, System.SysUtils, System.Classes, System.Types, System.Generics.Collections,
  Enum, ItemData, SharedData, State;

type
  TClientMagic = class
  public
    Name: string;
    Spell: TSpell;
    BaseCost, LevelCost, Icon: Byte;
    Level1, Level2, Level3: Byte;
    Need1, Need2, Need3: Word;
    Level, Key, Range: Byte;
    Experience: Word;
    IsTempSpell: Boolean;
    CastTime, Delay: Int64;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);
  end;

  TClientRecipeInfo = class
  public
    Gold: UInt32;
    Chance: Byte;
    Item: TUserItem;
    Tools: TList<TUserItem>;
    Ingredients: TList<TUserItem>;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);
  end;

  TClientFriend = class
  public
    Index: Integer;
    Name, Memo: string;
    Blocked, Online: Boolean;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);
  end;

  TClientMail = class
  public
    MailID: UInt64;
    SenderName: string;
    sMessage: string;
    Opened, Locked, CanReply, Collected: Boolean;
    DateSent: TDateTime;
    Gold: UInt32;
    Items: TList<TUserItem>;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);
  end;

  TClientAuction = class
  public
    AuctionID: UInt64;
    Item: TUserItem;
    Seller: string;
    Price: UInt32;
    ConsignmentDate: TDateTime;
    ItemType: TMarketItemType;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);
  end;

  TClientMovementInfo = class
  public
    Destination: Integer;
    Title: string;
    Location: TPoint;
    Icon: Integer;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);
  end;

  TClientNPCInfo = class
  public
    ObjectID: UInt32;
    Name: string;
    Location: TPoint;
    Icon: Integer;
    CanTeleportTo: Boolean;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);
  end;

  TClientMapInfo = class
  public
    Width, Height, BigMap: Integer;
    Title: string;
    Movements: TList<TClientMovementInfo>;
    NPCs: TList<TClientNPCInfo>;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);
  end;

  TClientQuestInfo = class
  public
    Index: Integer;
    NPCIndex: UInt32;
    Name, Group: string;
    Description, TaskDescription, ReturnDescription, CompletionDescription: TList<string>;
    MinLevelNeeded, MaxLevelNeeded, QuestNeeded: Integer;
    ClassNeeded: TRequiredClass;
    Type_: TQuestType;
    TimeLimitInSeconds: Integer;
    RewardGold, RewardExp, RewardCredit: UInt32;
    RewardsFixedItem, RewardsSelectItem: TList<TQuestItemReward>;
    FinishNPCIndex: UInt32;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);
    function GetQuestIcon(Taken, Completed: Boolean): TQuestIcon;

    property QuestIcon[Taken, Completed: Boolean]: TQuestIcon read GetQuestIcon;
  end;

  TClientQuestProgress = class
  public
    Id: Integer;
    QuestInfo: TClientQuestInfo;
    TaskList: TList<string>;
    Taken, Completed, New: Boolean;

    constructor Create;
    constructor CreateFromReader(const Reader: TBinaryReader);
    procedure SaveToStream(const Writer: TBinaryWriter);

    function Icon(): TQuestIcon;
  end;

  TClientBuff = class
  public
    Type_: TBuffType;
    Caster: string;
    Visible: Boolean;
    ObjectID: LongWord;
    ExpireTime: Int64;
    Infinite: Boolean;
    Stats: TStats;
    Paused: Boolean;

    Values: array of Integer;

    constructor Create;
    constructor CreateFromReader(BinaryReader: TBinaryReader);
    procedure Save(BinaryWriter: TBinaryWriter);
  end;

  TClientHeroInformation = class
  public
    Index: Integer;
    Name: string;
    Level: Word;
    HeroClass: TMirClass;
    Gender: TMirGender;

    constructor Create;
    constructor CreateFromReader(BinaryReader: TBinaryReader);
    procedure Save(BinaryWriter: TBinaryWriter);
    function ToString: string; override;
  end;

implementation

{ TClientMagic }

constructor TClientMagic.Create;
begin
  inherited;
end;

constructor TClientMagic.CreateFromReader(const Reader: TBinaryReader);
begin
  Name := Reader.ReadString;
  Spell := TSpell(Reader.ReadByte);
  BaseCost := Reader.ReadByte;
  LevelCost := Reader.ReadByte;
  Icon := Reader.ReadByte;
  Level1 := Reader.ReadByte;
  Level2 := Reader.ReadByte;
  Level3 := Reader.ReadByte;
  Need1 := Reader.ReadUInt16;
  Need2 := Reader.ReadUInt16;
  Need3 := Reader.ReadUInt16;
  Level := Reader.ReadByte;
  Key := Reader.ReadByte;
  Experience := Reader.ReadUInt16;
  Delay := Reader.ReadInt64;
  Range := Reader.ReadByte;
  CastTime := Reader.ReadInt64;
end;

procedure TClientMagic.SaveToStream(const Writer: TBinaryWriter);
begin
  Writer.Write(Name);
  Writer.Write(Byte(Spell));
  Writer.Write(BaseCost);
  Writer.Write(LevelCost);
  Writer.Write(Icon);
  Writer.Write(Level1);
  Writer.Write(Level2);
  Writer.Write(Level3);
  Writer.Write(Need1);
  Writer.Write(Need2);
  Writer.Write(Need3);
  Writer.Write(Level);
  Writer.Write(Key);
  Writer.Write(Experience);
  Writer.Write(Delay);
  Writer.Write(Range);
  Writer.Write(CastTime);
end;

{ TClientRecipeInfo }

constructor TClientRecipeInfo.Create;
begin
  Tools := TList<TUserItem>.Create;
  Ingredients := TList<TUserItem>.Create;
end;

constructor TClientRecipeInfo.CreateFromReader(const Reader: TBinaryReader);
var
  I, Count: Integer;
begin
  Gold := Reader.ReadUInt32;
  Chance := Reader.ReadByte;
  Item := TUserItem.CreateFromReader(Reader);

  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    Tools.Add(TUserItem.CreateFromReader(Reader));

  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    Ingredients.Add(TUserItem.CreateFromReader(Reader));
end;

procedure TClientRecipeInfo.SaveToStream(const Writer: TBinaryWriter);
var
  I, Count: Integer;
begin
  Writer.Write(Gold);
  Writer.Write(Chance);
  Item.SaveToStream(Writer);

  Count := Tools.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    Tools[I].SaveToStream(Writer);

  Count := Ingredients.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    Ingredients[I].SaveToStream(Writer);
end;

{ TClientFriend }

constructor TClientFriend.Create;
begin
  inherited;
end;

constructor TClientFriend.CreateFromReader(const Reader: TBinaryReader);
begin
  Index := Reader.ReadInt32;
  Name := Reader.ReadString;
  Memo := Reader.ReadString;
  Blocked := Reader.ReadBoolean;
  Online := Reader.ReadBoolean;
end;

procedure TClientFriend.SaveToStream(const Writer: TBinaryWriter);
begin
  Writer.Write(Index);
  Writer.Write(Name);
  Writer.Write(Memo);
  Writer.Write(Blocked);
  Writer.Write(Online);
end;

{ TClientMail }

constructor TClientMail.Create;
begin
  Items := TList<TUserItem>.Create;
end;

constructor TClientMail.CreateFromReader(const Reader: TBinaryReader);
var
  I, Count: Integer;
begin
  MailID := Reader.ReadUInt64;
  SenderName := Reader.ReadString;
  sMessage := Reader.ReadString;
  Opened := Reader.ReadBoolean;
  Locked := Reader.ReadBoolean;
  CanReply := Reader.ReadBoolean;
  Collected := Reader.ReadBoolean;
  DateSent := TDateTime(Reader.ReadInt64);
  Gold := Reader.ReadUInt32;
  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    Items.Add(TUserItem.CreateFromReader(Reader));
end;

procedure TClientMail.SaveToStream(const Writer: TBinaryWriter);
var
  I, Count: Integer;
begin
  Writer.Write(MailID);
  Writer.Write(SenderName);
  Writer.Write(sMessage);
  Writer.Write(Opened);
  Writer.Write(Locked);
  Writer.Write(CanReply);
  Writer.Write(Collected);
  Writer.Write(DateSent.MilliSecondOfTheYear);
  Writer.Write(Gold);
  Count := Items.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    Items[I].SaveToStream(Writer);
end;
{ TClientAuction }

constructor TClientAuction.Create;
begin
  Item := TUserItem.Create;
  inherited;
end;

constructor TClientAuction.CreateFromReader(const Reader: TBinaryReader);
begin
  AuctionID := Reader.ReadUInt64;
  Item := TUserItem.CreateFromReader(Reader);
  Seller := Reader.ReadString;
  Price := Reader.ReadUInt32;
  ConsignmentDate := TDateTime(Reader.ReadInt64);
  ItemType := TMarketItemType(Reader.ReadByte);
end;

procedure TClientAuction.SaveToStream(const Writer: TBinaryWriter);
begin
  Writer.Write(AuctionID);
  Item.SaveToStream(Writer);
  Writer.Write(Seller);
  Writer.Write(Price);
  Writer.Write(ConsignmentDate.MilliSecondOfTheYear);
  Writer.Write(Byte(ItemType));
end;

{ TClientMovementInfo }

constructor TClientMovementInfo.Create;
begin
  inherited;
end;

constructor TClientMovementInfo.CreateFromReader(const Reader: TBinaryReader);
begin
  Destination := Reader.ReadInt32;
  Title := Reader.ReadString;
  Location.X := Reader.ReadInt32;
  Location.Y := Reader.ReadInt32;
  Icon := Reader.ReadInt32;
end;

procedure TClientMovementInfo.SaveToStream(const Writer: TBinaryWriter);
begin
  Writer.Write(Destination);
  Writer.Write(Title);
  Writer.Write(Location.X);
  Writer.Write(Location.Y);
  Writer.Write(Icon);
end;
{ TClientNPCInfo }

constructor TClientNPCInfo.Create;
begin
  inherited;
end;

constructor TClientNPCInfo.CreateFromReader(const Reader: TBinaryReader);
begin
  ObjectID := Reader.ReadUInt32;
  Name := Reader.ReadString;
  Location.X := Reader.ReadInt32;
  Location.Y := Reader.ReadInt32;
  Icon := Reader.ReadInt32;
  CanTeleportTo := Reader.ReadBoolean;
end;

procedure TClientNPCInfo.SaveToStream(const Writer: TBinaryWriter);
begin
  Writer.Write(ObjectID);
  Writer.Write(Name);
  Writer.Write(Location.X);
  Writer.Write(Location.Y);
  Writer.Write(Icon);
  Writer.Write(CanTeleportTo);
end;

{ TClientMapInfo }

constructor TClientMapInfo.Create;
begin
  Movements := TList<TClientMovementInfo>.Create;
  NPCs := TList<TClientNPCInfo>.Create;
end;

constructor TClientMapInfo.CreateFromReader(const Reader: TBinaryReader);
var
  I, Count: Integer;
begin
  Title := Reader.ReadString;
  Width := Reader.ReadInt32;
  Height := Reader.ReadInt32;
  BigMap := Reader.ReadInt32;
  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    Movements.Add(TClientMovementInfo.CreateFromReader(Reader));
  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    NPCs.Add(TClientNPCInfo.CreateFromReader(Reader));
end;

procedure TClientMapInfo.SaveToStream(const Writer: TBinaryWriter);
var
  I, Count: Integer;
begin
  Writer.Write(Title);
  Writer.Write(Width);
  Writer.Write(Height);
  Writer.Write(BigMap);
  Count := Movements.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    Movements[I].SaveToStream(Writer);
  Count := NPCs.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    NPCs[I].SaveToStream(Writer);
end;
{ TClientQuestInfo }

constructor TClientQuestInfo.Create;
begin
  Description := TList<string>.Create;
  TaskDescription := TList<string>.Create;
  ReturnDescription := TList<string>.Create;
  CompletionDescription := TList<string>.Create;
  RewardsFixedItem := TList<TQuestItemReward>.Create;
  RewardsSelectItem := TList<TQuestItemReward>.Create;
end;

constructor TClientQuestInfo.CreateFromReader(const Reader: TBinaryReader);
var
  I, Count: Integer;
begin
  Index := Reader.ReadInt32;
  NPCIndex := Reader.ReadUInt32;
  Name := Reader.ReadString;
  Group := Reader.ReadString;

  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    Description.Add(Reader.ReadString);

  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    TaskDescription.Add(Reader.ReadString);

  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    ReturnDescription.Add(Reader.ReadString);

  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    CompletionDescription.Add(Reader.ReadString);

  MinLevelNeeded := Reader.ReadInt32;
  MaxLevelNeeded := Reader.ReadInt32;
  QuestNeeded := Reader.ReadInt32;
  ClassNeeded := TRequiredClass(Reader.ReadByte);
  Type_ := TQuestType(Reader.ReadByte);
  TimeLimitInSeconds := Reader.ReadInt32;
  RewardGold := Reader.ReadUInt32;
  RewardExp := Reader.ReadUInt32;
  RewardCredit := Reader.ReadUInt32;

  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    RewardsFixedItem.Add(TQuestItemReward.CreateFromReader(Reader));

  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    RewardsSelectItem.Add(TQuestItemReward.CreateFromReader(Reader));

  FinishNPCIndex := Reader.ReadUInt32;
end;

procedure TClientQuestInfo.SaveToStream(const Writer: TBinaryWriter);
var
  I, Count: Integer;
begin
  Writer.Write(Index);
  Writer.Write(NPCIndex);
  Writer.Write(Name);
  Writer.Write(Group);

  Count := Description.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    Writer.Write(Description[I]);

  Count := TaskDescription.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    Writer.Write(TaskDescription[I]);

  Count := ReturnDescription.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    Writer.Write(ReturnDescription[I]);

  Count := CompletionDescription.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    Writer.Write(CompletionDescription[I]);

  Writer.Write(MinLevelNeeded);
  Writer.Write(MaxLevelNeeded);
  Writer.Write(QuestNeeded);
  Writer.Write(Byte(ClassNeeded));
  Writer.Write(Byte(Type_));
  Writer.Write(TimeLimitInSeconds);
  Writer.Write(RewardGold);
  Writer.Write(RewardExp);
  Writer.Write(RewardCredit);

  Count := RewardsFixedItem.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    RewardsFixedItem[I].SaveToStream(Writer);

  Count := RewardsSelectItem.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    RewardsSelectItem[I].SaveToStream(Writer);

  Writer.Write(FinishNPCIndex);
end;

function TClientQuestInfo.GetQuestIcon(Taken, Completed: Boolean): TQuestIcon;
begin
  Result := qiNone;

  case Type_ of
    qtGeneral, qtRepeatable:
      begin
        if Completed then
          Result := qiQuestionYellow
        else if Taken then
          Result := qiQuestionWhite
        else
          Result := qiExclamationYellow;
      end;
    qtDaily:
      begin
        if Completed then
          Result := qiQuestionBlue
        else if Taken then
          Result := qiQuestionWhite
        else
          Result := qiExclamationBlue;
      end;
    qtStory:
      begin
        if Completed then
          Result := qiQuestionGreen
        else if Taken then
          Result := qiQuestionWhite
        else
          Result := qiExclamationGreen;
      end;
  end;
end;

{ TClientQuestProgress }

constructor TClientQuestProgress.Create;
begin
  TaskList := TList<string>.Create;
end;

constructor TClientQuestProgress.CreateFromReader(const Reader: TBinaryReader);
var
  I, Count: Integer;
begin
  Id := Reader.ReadInt32;

  Count := Reader.ReadInt32;
  for I := 0 to Count - 1 do
    TaskList.Add(Reader.ReadString);

  Taken := Reader.ReadBoolean;
  Completed := Reader.ReadBoolean;
  New := Reader.ReadBoolean;
end;

procedure TClientQuestProgress.SaveToStream(const Writer: TBinaryWriter);
var
  I, Count: Integer;
begin
  Writer.Write(Id);

  Count := TaskList.Count;
  Writer.Write(Count);
  for I := 0 to Count - 1 do
    Writer.Write(TaskList[I]);

  Writer.Write(Taken);
  Writer.Write(Completed);
  Writer.Write(New);
end;

function TClientQuestProgress.Icon(): TQuestIcon;
begin
  Result := QuestInfo.GetQuestIcon(Taken, Completed);
end;

{ TClientBuff }
constructor TClientBuff.Create;
begin
  Stats := TStats.Create;
end;

constructor TClientBuff.CreateFromReader(BinaryReader: TBinaryReader);
var
  count, i: Integer;
begin
  Caster := '';

  Type_ := TBuffType(BinaryReader.ReadByte);
  Visible := BinaryReader.ReadBoolean;
  ObjectID := BinaryReader.ReadUInt32;
  ExpireTime := BinaryReader.ReadInt64;
  Infinite := BinaryReader.ReadBoolean;
  Paused := BinaryReader.ReadBoolean;

  Stats := TStats.CreateFromReader(BinaryReader);

  count := BinaryReader.ReadInt32;
  SetLength(Values, count);
  for i := 0 to count - 1 do
  begin
    Values[i] := BinaryReader.ReadInt32;
  end;
end;

procedure TClientBuff.Save(BinaryWriter: TBinaryWriter);
var
  i: Integer;
begin
  BinaryWriter.Write(Byte(Type_));
  BinaryWriter.Write(Visible);
  BinaryWriter.Write(ObjectID);
  BinaryWriter.Write(ExpireTime);
  BinaryWriter.Write(Infinite);
  BinaryWriter.Write(Paused);

  Stats.Save(BinaryWriter);

  BinaryWriter.Write(Length(Values));
  for i := 0 to High(Values) do
  begin
    BinaryWriter.Write(Values[i]);
  end;
end;

{ TClientHeroInformation }
constructor TClientHeroInformation.Create;
begin
end;

constructor TClientHeroInformation.CreateFromReader(BinaryReader: TBinaryReader);
begin
  Index := BinaryReader.ReadInt32;
  Name := BinaryReader.ReadString;
  Level := BinaryReader.ReadUInt16;
  HeroClass := TMirClass(BinaryReader.ReadByte);
  Gender := TMirGender(BinaryReader.ReadByte);
end;

procedure TClientHeroInformation.Save(BinaryWriter: TBinaryWriter);
begin
  BinaryWriter.Write(Index);
  BinaryWriter.Write(Name);
  BinaryWriter.Write(Level);
  BinaryWriter.Write(Byte(HeroClass));
  BinaryWriter.Write(Byte(Gender));
end;

function TClientHeroInformation.ToString: string;
begin
  Result := Name + sLineBreak;
//  Result := Result + 'Level ' + IntToStr(Level) + ' ' + string(Enum.GetName(TypeInfo(TMirGender), Ord(Gender)).ToLower) + ' ' + string(Enum.GetName(TypeInfo(TMirClass), Ord(HeroClass)).ToLower);
end;

end.

