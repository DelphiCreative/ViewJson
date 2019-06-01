program JsonView;

uses
  System.StartUpCopy,
  FMX.Forms,
  uJSON in 'uJSON.pas' {Form1},
  uVisualizarDados in 'uVisualizarDados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
