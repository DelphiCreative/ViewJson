unit uJSON;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Memo1: TMemo;
    StyleBook1: TStyleBook;
    procedure Memo1ChangeTracking(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses uVisualizarDados;

procedure TForm1.Memo1ChangeTracking(Sender: TObject);
begin
   Layout1.GridJson(Memo1.Lines.Text);
end;


initialization
   ReportMemoryLeaksOnShutdown := True;


end.
