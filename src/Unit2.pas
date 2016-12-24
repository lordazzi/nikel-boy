unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ADODB, DB, Unit1, DBTables;


type
  TForm2 = class(TForm)
    Image1: TImage;
    NOME: TEdit;
    Label1: TLabel;
    SENHA: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    CMD: TADOCommand;
    CONN: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1Senha: TWideStringField;
    ADOQuery1pontos: TIntegerField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  PASS: string;
  PONTOS: integer;

implementation

{$R *.dfm}

procedure TForm2.Button2Click(Sender: TObject);
begin

If (NOME.Text <> '') AND (SENHA.Text <> '') then
begin
CMD.CommandText := 'INSERT INTO dados (Login, Senha, Pontos) VALUES ("' + NOME.Text + '", "' + SENHA.Text + '", 0)';
CMD.Execute;
PONTOS := 0;
Form1.EU.Tag := PONTOS;
Form1.USER.Caption := NOME.Text;
Form1.TIMER.Enabled := true;
Form1.ShowModal;
Form2.Close;
end

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
ADOQuery1.SQL.clear;
ADOQuery1.SQL.Add('SELECT Senha, pontos FROM dados WHERE Login="' + NOME.Text + '"');
ADOQuery1.Open;
 if   ADOQuery1.RecordCount <> 0 then
 begin
PASS := ADOQuery1Senha.Value;
PONTOS := ADOQuery1pontos.Value;
if SENHA.Text = PASS then
begin
Form1.USER.Caption := NOME.Text;
Form1.PONTOS.Caption := inttostr(PONTOS);
Form1.TIMER.Enabled := true;
Form1.ShowModal;
Form2.Close;
end
end
end;
end.
