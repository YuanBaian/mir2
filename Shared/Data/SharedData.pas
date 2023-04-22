unit SharedData;

interface

uses
  System.Classes;

type
  TQuestItemReward = class
    constructor CreateFromReader(const Reader: TBinaryReader);

    procedure SaveToStream(const Reader: TBinaryWriter);
  end;

implementation

constructor TQuestItemReward.CreateFromReader(const Reader: TBinaryReader);
begin

end;

procedure TQuestItemReward.SaveToStream(const Reader: TBinaryWriter);
begin

end;

end.

