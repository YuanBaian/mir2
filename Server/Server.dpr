program Server;

uses
  Vcl.Forms,
  Main in 'MirForm\Main.pas' {SMain},
  Packet in '..\Shared\Packet.pas',
  Enum in '..\Shared\Enum.pas',
  ServerPackets in 'ServerPackets.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSMain, SMain);
  Application.Run;
end.
