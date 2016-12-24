unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ADODB, Db;

type
  TForm1 = class(TForm)
    EU: TImage;
    ALVO: TImage;
    Label1: TLabel;
    PONTOS: TLabel;
    CONN: TADOConnection;
    CMD: TADOCommand;
    USER: TLabel;
    TIMER: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure TIMERTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Pos, WID_V, MENOR, MAIOR, MOEDAimg, Ouro: integer;

implementation

uses Unit2;

{$R *.DFM}

function MOEDAgrf(Alvo: TImage) :TImage;
begin
Alvo.Left := Random(Form1.Width);
Alvo.Top := Random(Form1.Height);
MOEDAimg := Random(3);

If MOEDAimg = 0 then
 begin
  alvo.Picture.LoadFromFile('moeda\1.bmp');
  alvo.Tag := 1;
 end

Else If MOEDAimg = 1 then
 begin
 alvo.Picture.LoadFromFile('moeda\2.bmp');
 alvo.Tag := 2;
  end

Else If MOEDAimg = 2 then
begin
alvo.Picture.LoadFromFile('moeda\3.bmp');
alvo.Tag := 3;
end

Else If MOEDAimg = 3 then
begin
alvo.Picture.LoadFromFile('moeda\3.bmp');
alvo.Tag := 3;
end

end;


function ExecuteGraphic(LADO: string; eu: TImage) :string;
begin

//IMAGEM
  If pos = 0 Then
   begin
      EU.Picture.LoadFromFile('Pessoa\Zeh_' + LADO + '_1.bmp');
      pos := 1;
   end

  Else If pos = 1 Then
   begin
      EU.Picture.LoadFromFile('Pessoa\Zeh_' + LADO + '_2.bmp');
      pos := 2;
   end

  Else If pos = 2 Then
   begin
      EU.Picture.LoadFromFile('Pessoa\Zeh_' + LADO + '_3.bmp');
      pos := 3;
   end

  Else If pos = 3 Then
   begin
      EU.Picture.LoadFromFile('Pessoa\Zeh_' + LADO + '_2.bmp');
      pos := 0;
   end;
end;


procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

If Key = VK_Down Then
 begin
 if EU.Top + EU.Height > Form1.Height then
 begin
 Eu.top := 0;
 end
 Else
 begin
EU.Top := EU.Top + 5;
end;
EU.Height := MENOR;
EU.Width := MAIOR;

ExecuteGraphic('baixo',EU);
 end




Else If Key = Vk_Up Then
begin

If EU.Top < 0 then
begin
EU.Top := Form1.Height - EU.Height;
end
Else
begin
EU.Top := EU.Top - 5;
end;

EU.Height := MENOR;
EU.Width := MAIOR;

ExecuteGraphic('cima', EU);
end





Else If Key = Vk_Left Then
begin

If EU.Left < 0 then
begin
EU.Left := Form1.Width - EU.Width;
end
Else
begin
EU.Left := EU.Left - 5;
end;

EU.Height := MAIOR;
EU.Width := MENOR;

ExecuteGraphic('esquerda', eu);
end






Else If Key = Vk_Right Then
begin
 if EU.Left + EU.Width > Form1.Width then
 begin
 Eu.Left := 0;
 end
 Else
 begin
EU.Left := EU.Left + 5;
end;
EU.Height := MAIOR;
EU.Width := MENOR;

ExecuteGraphic('direita', eu);
end;


If (EU.Left <= Alvo.Left) AND (Alvo.Left <= EU.Left + EU.Width) OR (EU.Left <= Alvo.Left + Alvo.Width) AND (Alvo.Left + Alvo.Width <= EU.Left + EU.Width) OR (Alvo.Left < EU.Left) AND (EU.Left + EU.Width < Alvo.Left + Alvo.Width) then
   begin
       If (EU.Top <= Alvo.Top) AND (Alvo.Top <= EU.Top + EU.Height) OR (EU.Top <= Alvo.Top + Alvo.Height) AND (Alvo.Top + Alvo.Height <= EU.Top + EU.Height) OR (Alvo.Top < EU.Top) AND (EU.Top + EU.Height < Alvo.Top + Alvo.Height) then
          begin
             OURO := OURO + Alvo.Tag;
             MOEDAgrf(ALVO);
              PONTOS.Caption := IntToStr(OURO);
              CMD.CommandText := 'UPDATE Dados SET Pontos=' + inttostr(Ouro) + ' WHERE Login="' + USER.Caption + '"';
              CMD.Execute;
          end
   end

end;



procedure TForm1.FormCreate(Sender: TObject);
begin
pos := 0;
MENOR := 32;
MAIOR := 58;
EU.Picture.LoadFromFile('Pessoa\Zeh_cima_2.bmp');
MOEDAgrf(Alvo);

end;

procedure TForm1.TIMERTimer(Sender: TObject);
begin
OURO := strtoint(PONTOS.Caption);
TIMER.Enabled := false;
end;

end.
