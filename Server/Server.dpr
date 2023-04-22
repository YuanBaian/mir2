program Server;

uses
  Vcl.Forms,
  Main in 'MirForm\Main.pas' {SMain},
  Packet in '..\Shared\Packet.pas',
  Enum in '..\Shared\Enum.pas',
  ServerPackets in '..\Shared\ServerPackets.pas',
  SelectInfo in '..\Shared\Data\SelectInfo.pas',
  ClientData in '..\Shared\Data\ClientData.pas',
  ItemData in '..\Shared\Data\ItemData.pas',
  SharedData in '..\Shared\Data\SharedData.pas',
  State in '..\Shared\Data\State.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSMain, SMain);
  Application.Run;
end.
