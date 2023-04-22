unit SelectInfo;

interface

uses
  System.DateUtils, System.SysUtils, System.Classes, Enum;
type
  TSelectInfo = class
  private
    FIndex: Integer;
    FName: string;
    FLevel: Word;
    FClass: TMirClass;
    FGender: TMirGender;
    FLastAccess: TDateTime;
  public
    property Index: Integer read FIndex write FIndex;
    property Name: string read FName write FName;
    property Level: Word read FLevel write FLevel;
    property MirClass: TMirClass read FClass write FClass;
    property MirGender: TMirGender read FGender write FGender;
    property LastAccess: TDateTime read FLastAccess write FLastAccess;

    constructor Create; overload;
    constructor Create(reader: TBinaryReader); overload;
    destructor Destroy; override;

    procedure Save(writer: TBinaryWriter);
  end;

implementation
{ TSelectInfo }

constructor TSelectInfo.Create;
begin

end;

constructor TSelectInfo.Create(reader: TBinaryReader);
begin
  FIndex := reader.ReadInt32;
  FName := reader.ReadString;
  FLevel := reader.ReadUInt16;
  FClass := TMirClass(reader.ReadByte);
  FGender := TMirGender(reader.ReadByte);
  FLastAccess := TDateTime(reader.ReadInt64);
end;

destructor TSelectInfo.Destroy;
begin
  inherited;
end;

procedure TSelectInfo.Save(writer: TBinaryWriter);
begin
  writer.Write(FIndex);
  writer.Write(FName);
  writer.Write(FLevel);
  writer.Write(Byte(FClass));
  writer.Write(Byte(FGender));
  writer.Write(FLastAccess.MilliSecondOfTheYear);
end;

end.

