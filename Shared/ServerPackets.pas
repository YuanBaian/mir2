unit ServerPackets;

interface

uses
  System.DateUtils, System.Classes, System.Generics.Collections, Packet, Enum, SelectInfo, ClientData;

type
//TSKeepAlive
  TSKeepAlive = class(TPacket)
  private
    FTime: Int64;
  public
    function GetIndex: SmallInt; override;

    property Time: Int64 read FTime write FTime;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

//TSConnected
  TSConnected = class(TPacket)
  public
    function GetIndex: SmallInt; override;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

//TSClientVersion
  TSClientVersion = class(TPacket)
  private
    FResult: Byte;
  public
    function GetIndex: SmallInt; override;

    property Result: Byte read FResult write FResult;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

//TSDisconnect
  TSDisconnect = class(TPacket)
  private
    FReason: Byte;
  public
    function GetIndex: SmallInt; override;

    property Reason: Byte read FReason write FReason;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

//TSNewAccount
  TSNewAccount = class(TPacket)
  private
    FResult: Byte;
  public
    function GetIndex: SmallInt; override;

    property Result: Byte read FResult write FResult;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

//TSChangePassword
  TSChangePassword = class(TPacket)
  private
    FResult: Byte;
  public
    function GetIndex: SmallInt; override;

    property Result: Byte read FResult write FResult;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

//TSChangePasswordBanned
  TSChangePasswordBanned = class(TPacket)
  private
    FReason: string;
    FExpiryDate: TDateTime;
  public
    function GetIndex: SmallInt; override;

    property Reason: string read FReason write FReason;
    property ExpiryDate: TDateTime read FExpiryDate write FExpiryDate;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

  //TSLogin
  TSLogin = class(TPacket)
  private
    FResult: Byte;
  public
    function GetIndex: SmallInt; override;

    property Result: Byte read FResult write FResult;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

  //TSLoginBanned
  TSLoginBanned = class(TPacket)
  private
    FReason: string;
    FExpiryDate: TDateTime;
  public
    function GetIndex: SmallInt; override;

    property Reason: string read FReason write FReason;
    property ExpiryDate: TDateTime read FExpiryDate write FExpiryDate;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

  //TSLoginSuccess
  TSLoginSuccess = class(TPacket)
  private
    FCharacters: TList<TSelectInfo>;
  public
    function GetIndex: SmallInt; override;

    property Characters: TList<TSelectInfo> read FCharacters;

    constructor Create; override;
    destructor Destroy; override;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

  //TSNewCharacter
  TSNewCharacter = class(TPacket)
  private
    FResult: Byte;
  public
    function GetIndex: SmallInt; override;

    property Result: Byte read FResult write FResult;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

  //TSNewCharacterSuccess
  TSNewCharacterSuccess = class(TPacket)
  private
    FCharInfo: TSelectInfo;
  public
    function GetIndex: SmallInt; override;

    property CharInfo: TSelectInfo read FCharInfo write FCharInfo;

    constructor Create; override;
    destructor Destroy; override;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

  //TSDeleteCharacter
  TSDeleteCharacter = class(TPacket)
  private
    FResult: Byte;
  public
    function GetIndex: SmallInt; override;

    property Result: Byte read FResult write FResult;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

  //TSDeleteCharacterSuccess
  TSDeleteCharacterSuccess = class(TPacket)
  private
    FCharacterIndex: Integer;
  public
    function GetIndex: SmallInt; override;

    property CharacterIndex: Integer read FCharacterIndex write FCharacterIndex;

    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;
  end;

  TSStartGame = class(TPacket)
  private
    FResult: Byte;
    FResolution: Integer;
  public
    function GetIndex: SmallInt; override;
    procedure ReadPacket(AReader: TBinaryReader); override;
    procedure WritePacket(AWriter: TBinaryWriter); override;
    property Result: Byte read FResult write FResult;
    property Resolution: Integer read FResolution write FResolution;
  end;

  TSStartGameBanned = class(TPacket)
  private
    FReason: string;
    FExpiryDate: TDateTime;
  public
    function GetIndex: SmallInt; override;
    procedure ReadPacket(AReader: TBinaryReader); override;
    procedure WritePacket(AWriter: TBinaryWriter); override;
    property Reason: string read FReason write FReason;
    property ExpiryDate: TDateTime read FExpiryDate write FExpiryDate;
  end;

  TSStartGameDelay = class(TPacket)
  private
    FMilliseconds: Int64;
  public
    function GetIndex: SmallInt; override;
    procedure ReadPacket(AReader: TBinaryReader); override;
    procedure WritePacket(AWriter: TBinaryWriter); override;
    property Milliseconds: Int64 read FMilliseconds write FMilliseconds;
  end;

  TSMapInformation = class(TPacket)
  private
    FMapIndex: Integer;
    FFileName: string;
    FTitle: string;
    FMiniMap: Word;
    FBigMap: Word;
    FLights: TLightSetting;
    FLightning: Boolean;
    FFire: Boolean;
    FMapDarkLight: Byte;
    FMusic: Word;
  public
    function GetIndex: SmallInt; override;
    procedure ReadPacket(AReader: TBinaryReader); override;
    procedure WritePacket(AWriter: TBinaryWriter); override;
    property MapIndex: Integer read FMapIndex write FMapIndex;
    property FileName: string read FFileName write FFileName;
    property Title: string read FTitle write FTitle;
    property MiniMap: Word read FMiniMap write FMiniMap;
    property BigMap: Word read FBigMap write FBigMap;
    property Lights: TLightSetting read FLights write FLights;
    property Lightning: Boolean read FLightning write FLightning;
    property Fire: Boolean read FFire write FFire;
    property MapDarkLight: Byte read FMapDarkLight write FMapDarkLight;
    property Music: Word read FMusic write FMusic;
  end;

  TSNewMapInfo = class(TPacket)
  private
    FMapIndex: Integer;
    FInfo: TClientMapInfo;
  public
    function GetIndex: SmallInt; override;
    procedure ReadPacket(AReader: TBinaryReader); override;
    procedure WritePacket(AWriter: TBinaryWriter); override;
    property MapIndex: Integer read FMapIndex write FMapIndex;
    property Info: TClientMapInfo read FInfo write FInfo;
  end;

implementation


{ TSKeepAlive }

function TSKeepAlive.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spKeepAlive);
end;

procedure TSKeepAlive.ReadPacket(reader: TBinaryReader);
begin
  FTime := reader.ReadInt64;
end;

procedure TSKeepAlive.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FTime);
end;

{ TSConnected }

function TSConnected.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spConnected);
end;

procedure TSConnected.ReadPacket(reader: TBinaryReader);
begin
//Do nothing
end;

procedure TSConnected.WritePacket(writer: TBinaryWriter);
begin
//Do nothing
end;

{ TSClientVersion }

function TSClientVersion.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spClientVersion);
end;

procedure TSClientVersion.ReadPacket(reader: TBinaryReader);
begin
  FResult := reader.ReadByte;
end;

procedure TSClientVersion.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FResult);
end;

{ TSDisconnect }

function TSDisconnect.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spDisconnect);
end;

procedure TSDisconnect.ReadPacket(reader: TBinaryReader);
begin
  FReason := reader.ReadByte;
end;

procedure TSDisconnect.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FReason);
end;

{ TSNewAccount }

function TSNewAccount.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spNewAccount);
end;

procedure TSNewAccount.ReadPacket(reader: TBinaryReader);
begin
  FResult := reader.ReadByte;
end;

procedure TSNewAccount.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FResult);
end;

{ TSChangePassword }

function TSChangePassword.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spChangePassword);
end;

procedure TSChangePassword.ReadPacket(reader: TBinaryReader);
begin
  FResult := reader.ReadByte;
end;

procedure TSChangePassword.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FResult);
end;

{ TSChangePasswordBanned }

function TSChangePasswordBanned.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spChangePasswordBanned);
end;

procedure TSChangePasswordBanned.ReadPacket(reader: TBinaryReader);
begin
  FReason := reader.ReadString;
  FExpiryDate := reader.ReadInt64;
end;

procedure TSChangePasswordBanned.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FReason);
  writer.Write(FExpiryDate);
end;

{ TSLogin }

function TSLogin.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spLogin);
end;

procedure TSLogin.ReadPacket(reader: TBinaryReader);
begin
  FResult := reader.ReadByte;
end;

procedure TSLogin.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FResult);
end;

{ TSLoginBanned }

function TSLoginBanned.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spLoginBanned);
end;

procedure TSLoginBanned.ReadPacket(reader: TBinaryReader);
begin
  FReason := reader.ReadString;
  FExpiryDate := reader.ReadInt64;
end;

procedure TSLoginBanned.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FReason);
  writer.Write(FExpiryDate);
end;

{ TSLoginSuccess }

constructor TSLoginSuccess.Create;
begin
  inherited;
  FCharacters := TList<TSelectInfo>.Create;
end;

destructor TSLoginSuccess.Destroy;
begin
  FCharacters.Free;
  inherited;
end;

function TSLoginSuccess.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spLoginSuccess);
end;

procedure TSLoginSuccess.ReadPacket(reader: TBinaryReader);
var
  Count, I: Integer;
begin
  Count := reader.ReadInt32;

  for I := 0 to Count - 1 do
    FCharacters.Add(TSelectInfo.Create(reader));
end;

procedure TSLoginSuccess.WritePacket(writer: TBinaryWriter);
var
  I: Integer;
begin
  writer.Write(FCharacters.Count);

  for I := 0 to FCharacters.Count - 1 do
    FCharacters[I].Save(writer);
end;

{ TSNewCharacter }

function TSNewCharacter.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spNewCharacter);
end;

procedure TSNewCharacter.ReadPacket(reader: TBinaryReader);
begin
  FResult := reader.ReadByte;
end;

procedure TSNewCharacter.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FResult);
end;

{ TSNewCharacterSuccess }

constructor TSNewCharacterSuccess.Create;
begin
  inherited;
  FCharInfo := TSelectInfo.Create;
end;

destructor TSNewCharacterSuccess.Destroy;
begin
  FCharInfo.Free;
  inherited;
end;

function TSNewCharacterSuccess.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spNewCharacterSuccess);
end;

procedure TSNewCharacterSuccess.ReadPacket(reader: TBinaryReader);
begin
  FCharInfo := TSelectInfo.Create(reader);
end;

procedure TSNewCharacterSuccess.WritePacket(writer: TBinaryWriter);
begin
  FCharInfo.Save(writer);
end;

{ TSDeleteCharacter }

function TSDeleteCharacter.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spDeleteCharacter);
end;

procedure TSDeleteCharacter.ReadPacket(reader: TBinaryReader);
begin
  FResult := reader.ReadByte;
end;

procedure TSDeleteCharacter.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FResult);
end;

{ TSDeleteCharacterSuccess }

function TSDeleteCharacterSuccess.GetIndex: SmallInt;
begin
  Result := Ord(TServerPacketIds.spDeleteCharacterSuccess);
end;

procedure TSDeleteCharacterSuccess.ReadPacket(reader: TBinaryReader);
begin
  FCharacterIndex := reader.ReadInt32;
end;

procedure TSDeleteCharacterSuccess.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FCharacterIndex);
end;

{ TSStartGame }

function TSStartGame.GetIndex: SmallInt;
begin
  Result := SmallInt(TServerPacketIds.spStartGame);
end;

procedure TSStartGame.ReadPacket(AReader: TBinaryReader);
begin
  FResult := AReader.ReadByte;
  FResolution := AReader.ReadInt32;
end;

procedure TSStartGame.WritePacket(AWriter: TBinaryWriter);
begin
  AWriter.Write(FResult);
  AWriter.Write(FResolution);
end;

{ TSStartGameBanned }

function TSStartGameBanned.GetIndex: SmallInt;
begin
  Result := SmallInt(TServerPacketIds.spStartGameBanned);
end;

procedure TSStartGameBanned.ReadPacket(AReader: TBinaryReader);
begin
  FReason := AReader.ReadString;
  FExpiryDate := TDateTime(AReader.ReadInt64);
end;

procedure TSStartGameBanned.WritePacket(AWriter: TBinaryWriter);
begin
  AWriter.Write(FReason);
  AWriter.Write(FExpiryDate.MilliSecondOfTheYear);
end;

{ TSStartGameDelay }

function TSStartGameDelay.GetIndex: SmallInt;
begin
  Result := SmallInt(TServerPacketIds.spStartGameDelay);
end;

procedure TSStartGameDelay.ReadPacket(AReader: TBinaryReader);
begin
  FMilliseconds := AReader.ReadInt64;
end;

procedure TSStartGameDelay.WritePacket(AWriter: TBinaryWriter);
begin
  AWriter.Write(FMilliseconds);
end;

{ TSMapInformation }

function TSMapInformation.GetIndex: SmallInt;
begin
  Result := SmallInt(TServerPacketIds.spMapInformation);
end;

procedure TSMapInformation.ReadPacket(AReader: TBinaryReader);
var
  bools: Byte;
begin
  FMapIndex := AReader.ReadInt32;
  FFileName := AReader.ReadString;
  FTitle := AReader.ReadString;
  FMiniMap := AReader.ReadUInt16;
  FBigMap := AReader.ReadUInt16;
  FLights := TLightSetting(AReader.ReadByte);
  bools := AReader.ReadByte;
  FLightning := bools and $01 = $01;
  FFire := bools and $02 = $02;
  FMapDarkLight := AReader.ReadByte;
  FMusic := AReader.ReadUInt16;
end;

procedure TSMapInformation.WritePacket(AWriter: TBinaryWriter);
var
  bools: Byte;
begin
  AWriter.Write(FMapIndex);
  AWriter.Write(FFileName);
  AWriter.Write(FTitle);
  AWriter.Write(FMiniMap);
  AWriter.Write(FBigMap);
  AWriter.Write(Ord(FLights));
  bools := 0;
  if FLightning then
    bools := bools or $01;
  if FFire then
    bools := bools or $02;
  AWriter.Write(bools);
  AWriter.Write(FMapDarkLight);
  AWriter.Write(FMusic);
end;

{ TSNewMapInfo }

function TSNewMapInfo.GetIndex: SmallInt;
begin
  Result := SmallInt(TServerPacketIds.spNewMapInfo);
end;

procedure TSNewMapInfo.ReadPacket(AReader: TBinaryReader);
begin
  FMapIndex := AReader.ReadInt32;
  FInfo := TClientMapInfo.CreateFromReader(AReader);
end;

procedure TSNewMapInfo.WritePacket(AWriter: TBinaryWriter);
begin
  AWriter.Write(FMapIndex);
  FInfo.SaveToStream(AWriter);
end;

end.

