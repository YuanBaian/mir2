unit State;

interface

uses
  System.Classes;

type
  TStats = class
    constructor CreateFromReader(const Reader: TBinaryReader);

    procedure Save(const Reader: TBinaryWriter);
  end;

implementation

constructor TStats.CreateFromReader(const Reader: TBinaryReader);
begin

end;

procedure TStats.Save(const Reader: TBinaryWriter);
begin

end;
end.

