unit ServerPackets;

interface

uses
  System.Classes, Packet;

type
  TSConnected = class sealed(TPacket)
    function GetIndex(): SmallInt; override;
    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(reader: TBinaryWriter); override;
  end;

  TSStartGameDelay = class sealed(TPacket)
  private
    FMilliseconds: Int64;
  public
    function GetIndex: SmallInt; override;
    procedure ReadPacket(reader: TBinaryReader); override;
    procedure WritePacket(writer: TBinaryWriter); override;

    property Milliseconds: Int64 read FMilliseconds write FMilliseconds;
  end;

implementation
uses
  Enum;

{ TSConnected }

function TSConnected.GetIndex(): SmallInt;
begin
  Result := Ord(TServerPacketIds.spConnected);
end;

procedure TSConnected.ReadPacket(reader: TBinaryReader);
begin

end;

procedure TSConnected.WritePacket(reader: TBinaryWriter);
begin

end;

{ TSStartGameDelay }

function TSStartGameDelay.GetIndex: SmallInt;
begin
  Result := SmallInt(TServerPacketIds.spStartGameDelay);
end;

procedure TSStartGameDelay.ReadPacket(reader: TBinaryReader);
begin
  FMilliseconds := reader.ReadInt64;
end;

procedure TSStartGameDelay.WritePacket(writer: TBinaryWriter);
begin
  writer.Write(FMilliseconds);
end;

end.

