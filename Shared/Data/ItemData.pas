unit ItemData;

interface

uses
  System.Classes;

type
  TUserItem = class
  public
    constructor CreateFromReader(const Reader: TBinaryReader);

    procedure SaveToStream(const Reader: TBinaryWriter);
  end;

implementation

constructor TUserItem.CreateFromReader(const Reader: TBinaryReader);
begin

end;

procedure TUserItem.SaveToStream(const Reader: TBinaryWriter);
begin

end;

end.

