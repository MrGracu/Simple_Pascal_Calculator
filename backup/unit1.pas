{ MADE BY GRACJAN MIKA }
{ COPYRIGHT (C) BY GRACJAN MIKA }

unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType;

type
  tabStringow = array[0..2] of string;
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function liczbaSpacji(tekst:string): integer;
var
  ilosc,i:integer;
begin
  ilosc:=0;

  for i:=1 to Length(tekst) do
  begin
    if(tekst[i] = ' ') then inc(ilosc);
  end;

  liczbaSpacji := ilosc;
end;

procedure removeFocusControl();
begin
  Form1.ActiveControl:=Form1.Edit3;
end;

procedure splitujString(tekst:string; var tab:tabStringow);
var
  i,iloscSpacji:integer;
begin
  for i:=0 to (Length(tab)-1) do
  begin
    tab[i]:='';
  end;
  iloscSpacji:=0;
  for i:=1 to Length(tekst) do
  begin
    if(tekst[i] = ' ') then inc(iloscSpacji) else
    begin
      tab[iloscSpacji] := tab[iloscSpacji] + tekst[i];
    end;
  end;
end;

procedure pierwiastek(var nr:Extended);
var
  a:Extended;
begin
  a := nr;
  nr := a/2;
  while abs(a/nr-nr) > 0.000001 do
  begin
    nr := (a/nr-nr)/2;
  end;
  nr := abs(nr);
end;

function wykonajDzialanie(tekst:string;var wynik:string):Boolean;
var
  nr:Extended;
  czyDalej:Boolean;
  tabStr:tabStringow;
  i:integer;
begin
  czyDalej := false;

  splitujString(tekst, tabStr);
  if(tabStr[1] = '/') then
  begin
    if(StrToFloat(tabStr[2]) <> 0) then
    begin
      nr := StrToFloat(tabStr[0]) / StrToFloat(tabStr[2]);
      wynik := FloatToStr(nr);
      czyDalej := true;
    end else
    begin
      ShowMessage('Nie można dzielić przez 0!');
    end;
  end;
  if(tabStr[1] = '*') then
  begin
    nr := StrToFloat(tabStr[0]) * StrToFloat(tabStr[2]);
    wynik := FloatToStr(nr);
    czyDalej := true;
  end;
  if(tabStr[1] = '-') then
  begin
    nr := StrToFloat(tabStr[0]) - StrToFloat(tabStr[2]);
    wynik := FloatToStr(nr);
    czyDalej := true;
  end;
  if(tabStr[1] = '+') then
  begin
    nr := StrToFloat(tabStr[0]) + StrToFloat(tabStr[2]);
    wynik := FloatToStr(nr);
    czyDalej := true;
  end;
  if(tabStr[1] = '^') then
  begin
    if(pos(',',tabStr[2]) = 0) then
    begin
      if(tabStr[2] = '0') then
      begin
        wynik := '1';
      end else
      begin
        nr := StrToFloat(tabStr[0]);
        for i:=2 to abs(StrToInt(tabStr[2])) do
        begin
          nr := nr * StrToFloat(tabStr[0]);
        end;
        if(StrToFloat(tabStr[2]) < 0) then
        begin
          nr := 1/nr;
        end;
        wynik := FloatToStr(nr);
      end;
      czyDalej := true;
    end else
    begin
      ShowMessage('Wykładnik potęgi musi być całkowity!');
    end;
  end;

  wykonajDzialanie := czyDalej;
end;

procedure TForm1.Button21Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text <> '0' then
  begin
    if(liczbaSpacji(Edit1.Text) = 0) then
    begin
      Edit1.Text := Edit1.Text + '0';
    end else
    begin
      splitujString(Edit1.Text, tabStr);
      if(tabStr[2] <> '0') then
      begin
        Edit1.Text := Edit1.Text + '0';
      end;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button22Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  splitujString(Edit1.Text, tabStr);
  if Length(tabStr[1]) > 0 then
  begin
    if(pos(',',tabStr[2]) = 0) then
    begin
      if(Length(tabStr[2]) > 0) then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2] + ',' else Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 0,';
    end;
  end else
  begin
    if(pos(',',tabStr[0]) = 0) then
    begin
      if(Length(tabStr[0]) > 0) then Edit1.Text := tabStr[0] + ',' else Edit1.Text := '0,';
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button23Click(Sender: TObject);
var
  tabStr:tabStringow;
  wartosc:string;
begin
  if(Length(Edit1.Text) > 0) then
  begin
    if(liczbaSpacji(Edit1.Text) = 0) then
    begin
      wartosc := Edit1.Text;
      if(wartosc[Length(wartosc)] = ',') then
      begin
        Delete(wartosc,Length(wartosc),1);
        Edit1.Text := wartosc;
      end;
      Edit1.Text := Edit1.Text + ' + ';
    end else
    begin
      splitujString(Edit1.Text, tabStr);
      if(Length(tabStr[2]) > 0) then
      begin
        if(tabStr[2][Length(tabStr[2])] = ',') then
        begin
          Delete(tabStr[2],Length(tabStr[2]),1);
          Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
        end;
        if(wykonajDzialanie(Edit1.Text, wartosc)) then
        begin
          Edit2.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
          Edit1.Text := wartosc + ' + ';
        end;
      end else
      begin
        Edit1.Text := tabStr[0] + ' + ';
      end;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button24Click(Sender: TObject);
var
  tabStr:tabStringow;
  wartosc:string;
begin
  if(Length(Edit1.Text) > 0) then
  begin
    splitujString(Edit1.Text, tabStr);
    if((Length(tabStr[2]) > 0) and (Length(tabStr[1]) > 0)) then
    begin
      if(tabStr[2][Length(tabStr[2])] = ',') then
      begin
        Delete(tabStr[2],Length(tabStr[2]),1);
        Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
      end;
      if(wykonajDzialanie(Edit1.Text, wartosc)) then
      begin
        Edit2.Text := Edit1.Text;
        Edit1.Text := wartosc;
      end;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button25Click(Sender: TObject);
var
  tabStr:tabStringow;
  tekst,wynik,znaki:string;
  wartosc:integer;
begin
  znaki := '0123456789ABCDEF';
  tekst := Edit1.Text;
  if(liczbaSpacji(tekst) = 0) then
  begin
    if(tekst[Length(tekst)] = ',') then
    begin
      Delete(tekst,Length(tekst),1);
      Edit1.Text := tekst;
    end;
    if((pos(',',tekst) = 0) and (StrToFloat(tekst) >= 0)) then
    begin
      wynik:='';
      wartosc := StrToint(tekst);
      while wartosc <> 0 do
      begin
        wynik := wynik + znaki[(wartosc mod 16) + 1];
        wartosc := wartosc div 16;
      end;
      tekst := '';
      for wartosc := Length(wynik) downto 1 do tekst := tekst + wynik[wartosc];
      if(Length(tekst) = 0) then tekst := '0';
      ShowMessage(tekst);
    end else ShowMessage('Liczba musi być całkowita!');
  end else
  begin
    splitujString(Edit1.Text, tabStr);
    if(liczbaSpacji(Edit1.Text) = 2) and (Length(tabStr[2]) > 0) then
    begin
      if((pos(',',tabStr[2]) = 0) and (StrToFloat(tabStr[2]) >= 0)) then
      begin
        wynik:='';
        wartosc := StrToint(tabStr[2]);
        while wartosc <> 0 do
        begin
          wynik := wynik + znaki[(wartosc mod 16) + 1];
          wartosc := wartosc div 16;
        end;
        tabStr[2] := '';
        for wartosc := Length(wynik) downto 1 do tabStr[2] := tabStr[2] + wynik[wartosc];
        ShowMessage(tabStr[2]);
      end else ShowMessage('Liczba musi być naturalna!');
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  tabStr:tabStringow;
  tekst:string;
begin
  tekst := Edit1.Text;
  if(liczbaSpacji(Edit1.Text) = 0) then Edit1.Text := '0' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(liczbaSpacji(Edit1.Text) = 2) and (Length(tabStr[2]) > 0) then
    begin
      Delete(tekst,(Length(tekst) - Length(tabStr[2]) + 1),Length(tabStr[2]));
      Edit1.Text := tekst;
    end else
    begin
      Delete(tekst,(Length(tekst) - 2),3);
      Edit1.Text := tekst;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Text := '0';
  Edit2.Text := '';
  removeFocusControl();
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  tabStr:tabStringow;
  wartosc:Extended;
begin
  if(Length(Edit1.Text) > 0) then
  begin
    splitujString(Edit1.Text, tabStr);
    if(liczbaSpacji(Edit1.Text) = 0) then
    begin
      wartosc := StrToFloat(tabStr[0]);
      if(wartosc > 0) then
      begin
        Edit1.Text := '-' + tabStr[0];
      end else
      begin
        if(wartosc < 0) then
        begin
          Delete(tabStr[0],1,1);
          Edit1.Text := tabStr[0];
        end;
      end;
    end else
    begin
      if(Length(tabStr[2]) > 0) then
      begin
        wartosc := StrToFloat(tabStr[2]);
        if(wartosc > 0) then
        begin
          Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' -' + tabStr[2];
        end else
        begin
          if(wartosc < 0) then
          begin
            Delete(tabStr[2],1,1);
            Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
          end;
        end;
      end;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  tabStr:tabStringow;
  wartosc:Extended;
  tekst:string;
begin
  if(Length(Edit1.Text) > 0) then
  begin
    if(liczbaSpacji(Edit1.Text) = 0) then
    begin
      tekst := Edit1.Text;
      if(tekst[Length(tekst)] = ',') then
      begin
        Delete(tekst,Length(tekst),1);
        Edit1.Text := tekst;
      end;
      wartosc := StrToFloat(Edit1.Text);
      if(wartosc > 0) then
      begin
        tekst := Edit1.Text;
        pierwiastek(wartosc);
        Edit2.Text := '√' + Edit1.Text;
        Edit1.Text := FloatToStr(wartosc);
      end else ShowMessage('Pierwiastek tylko z liczby dodatniej większej od 0!');
    end else
    begin
      splitujString(Edit1.Text, tabStr);
      if(length(tabStr[2]) > 0) then
      begin
        wartosc := StrToFloat(tabStr[2]);
        if(wartosc > 0) then
        begin
          if(tabStr[2][Length(tabStr[2])] = ',') then
          begin
            Delete(tabStr[2],Length(tabStr[2]),1);
            Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
          end;
          pierwiastek(wartosc);
          if(tabStr[2][Length(tabStr[2])] = ',') then
          begin
            Delete(tabStr[2],Length(tabStr[2]),1);
          end;
          Edit2.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + '√' + tabStr[2];
          Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + FloatToStr(wartosc);
        end else ShowMessage('Pierwiastek tylko z liczby dodatniej większej od 0!');
      end;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text = '0' then Edit1.Text := '7' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(tabStr[2] = '0') then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 7' else Edit1.Text := Edit1.Text + '7';
  end;
  removeFocusControl();
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text = '0' then Edit1.Text := '8' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(tabStr[2] = '0') then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 8' else Edit1.Text := Edit1.Text + '8';
  end;
  removeFocusControl();
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text = '0' then Edit1.Text := '9' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(tabStr[2] = '0') then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 9' else Edit1.Text := Edit1.Text + '9';
  end;
  removeFocusControl();
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  tabStr:tabStringow;
  wartosc:string;
begin
  if(Length(Edit1.Text) > 0) then
  begin
    if(liczbaSpacji(Edit1.Text) = 0) then
    begin
      wartosc := Edit1.Text;
      if(wartosc[Length(wartosc)] = ',') then
      begin
        Delete(wartosc,Length(wartosc),1);
        Edit1.Text := wartosc;
      end;
      Edit1.Text := Edit1.Text + ' / ';
    end else
    begin
      splitujString(Edit1.Text, tabStr);
      if(Length(tabStr[2]) > 0) then
      begin
        if(tabStr[2][Length(tabStr[2])] = ',') then
        begin
          Delete(tabStr[2],Length(tabStr[2]),1);
          Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
        end;
        if(wykonajDzialanie(Edit1.Text, wartosc)) then
        begin
          Edit2.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
          Edit1.Text := wartosc + ' / ';
        end;
      end else
      begin
        Edit1.Text := tabStr[0] + ' / ';
      end;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
var
  Send:TObject;
begin
  if(Key = VK_BACK) then Button1Click(Send)
  else if(Key = VK_DELETE) then Button2Click(Send)
  else if(Key = VK_ESCAPE) then Button3Click(Send)
  else if((Shift = [ssShift]) and (Key = VK_2)) then Button5Click(Send)
  else if((Shift = [ssShift]) and (Key = VK_6)) then Button20Click(Send)
  else if(((Shift = [ssShift]) and (Key = VK_8)) or (Key = VK_MULTIPLY)) then Button14Click(Send)
  else if((Key = VK_OEM_2) or (Key = VK_DIVIDE)) then Button9Click(Send)
  else if((Shift = [ssShift]) and (Key = VK_5)) then Button10Click(Send)
  else if((Key = VK_SUBTRACT) or (Key = VK_OEM_MINUS)) then Button19Click(Send)
  else if(Key = VK_R) then Button15Click(Send)
  else if(Key = VK_H) then Button25Click(Send)
  else if(Key = VK_F9) then Button4Click(Send)
  else if((Key = VK_OEM_COMMA) or (Key = VK_OEM_PERIOD) or (Key = VK_DECIMAL)) then Button22Click(Send)
  else if((Key = VK_ADD) or ((Shift = [ssShift]) and (Key = VK_OEM_PLUS))) then Button23Click(Send)
  else if((Key = VK_OEM_PLUS) or (Key = VK_RETURN)) then
  begin
    Button24Click(Send);
    Key:=0;
  end
  else if((Key = VK_7) or (Key = VK_NUMPAD7)) then Button6Click(Send)
  else if((Key = VK_8) or (Key = VK_NUMPAD8)) then Button7Click(Send)
  else if((Key = VK_9) or (Key = VK_NUMPAD9)) then Button8Click(Send)
  else if((Key = VK_4) or (Key = VK_NUMPAD4)) then Button11Click(Send)
  else if((Key = VK_5) or (Key = VK_NUMPAD5)) then Button12Click(Send)
  else if((Key = VK_6) or (Key = VK_NUMPAD6)) then Button13Click(Send)
  else if((Key = VK_1) or (Key = VK_NUMPAD1)) then Button16Click(Send)
  else if((Key = VK_2) or (Key = VK_NUMPAD2)) then Button17Click(Send)
  else if((Key = VK_3) or (Key = VK_NUMPAD3)) then Button18Click(Send)
  else if((Key = VK_0) or (Key = VK_NUMPAD0)) then Button21Click(Send)
  else if(Key = VK_F1) then Application.MessageBox('Autor: Gracjan Mika ( https://gmika.pl )' + sLineBreak + sLineBreak + 'Skróty klawiszowe:' + sLineBreak + 'Backspace - Usuń pojedyńczy znak' + sLineBreak + 'Del - Usuń ciąg znaków do spacji' + sLineBreak + 'Esc - Wyczyść' + sLineBreak + 'F9 - Zamień liczbę na ujemną/dodatnią' + sLineBreak + '@ - Pierwiastek kwadratowy'+ sLineBreak + 'R - Podzielenie 1/<liczba>' + sLineBreak + 'H - Podanie liczby w postaci heksadecymanlej' + sLineBreak + 'Pozostałe elementy posiadają takie skróty jakie są na przyciskach.' + sLineBreak + sLineBreak + 'Copyright © by Gracjan Mika.',' O programie: Easy Calculator',MB_ICONINFORMATION);
  Form1.ActiveControl:=Edit3;
end;

procedure TForm1.Button16Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text = '0' then Edit1.Text := '1' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(tabStr[2] = '0') then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 1' else Edit1.Text := Edit1.Text + '1';
  end;
  removeFocusControl();
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text = '0' then Edit1.Text := '4' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(tabStr[2] = '0') then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 4' else Edit1.Text := Edit1.Text + '4';
  end;
  removeFocusControl();
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if(Length(Edit1.Text)>0) then
  begin
    splitujString(Edit1.Text, tabStr);
    if(Length(tabStr[2]) > 0) then
    begin
      if(tabStr[2][Length(tabStr[2])] = ',') then
      begin
        Delete(tabStr[2],Length(tabStr[2]),1);
      end;
      Edit2.Text := tabStr[0] + ' ' + tabStr[1] + ' ((' + tabStr[2] + ' / 100) * ' + tabStr[0] + ')';
      tabStr[2] := FloatToStr((StrToFloat(tabStr[2])/100)*StrToFloat(tabStr[0]));
      Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text = '0' then Edit1.Text := '5' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(tabStr[2] = '0') then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 5' else Edit1.Text := Edit1.Text + '5';
  end;
  removeFocusControl();
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text = '0' then Edit1.Text := '6' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(tabStr[2] = '0') then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 6' else Edit1.Text := Edit1.Text + '6';
  end;
  removeFocusControl();
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  tabStr:tabStringow;
  wartosc:string;
begin
  if(Length(Edit1.Text) > 0) then
  begin
    if(liczbaSpacji(Edit1.Text) = 0) then
    begin
      wartosc := Edit1.Text;
      if(wartosc[Length(wartosc)] = ',') then
      begin
        Delete(wartosc,Length(wartosc),1);
        Edit1.Text := wartosc;
      end;
      Edit1.Text := Edit1.Text + ' * ';
    end else
    begin
      splitujString(Edit1.Text, tabStr);
      if(Length(tabStr[2]) > 0) then
      begin
        if(tabStr[2][Length(tabStr[2])] = ',') then
        begin
          Delete(tabStr[2],Length(tabStr[2]),1);
          Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
        end;
        if(wykonajDzialanie(Edit1.Text, wartosc)) then
        begin
          Edit2.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
          Edit1.Text := wartosc + ' * ';
        end;
      end else
      begin
        Edit1.Text := tabStr[0] + ' * ';
      end;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button15Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if(Length(Edit1.Text) > 0) then
  begin
    splitujString(Edit1.Text, tabStr);
    if((Length(tabStr[1]) > 0) and (Length(tabStr[2]) > 0)) then
    begin
      if(StrToFloat(tabStr[2]) <> 0) then
      begin
        if(tabStr[2][Length(tabStr[2])] = ',') then
        begin
          Delete(tabStr[2],Length(tabStr[2]),1);
        end;
        Edit2.Text := tabStr[0] + ' ' + tabStr[1] + ' (1 / ' + tabStr[2] + ')';
        tabStr[2] := FloatToStr(1/StrToFloat(tabStr[2]));
        Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
      end else
      begin
        ShowMessage('Nie można dzielić przez 0!');
      end;
    end else
    begin
      if(Length(tabStr[1]) = 0) then
      begin
        if(tabStr[0][Length(tabStr[0])] = ',') then
        begin
          Delete(tabStr[0],Length(tabStr[0]),1);
          Edit1.Text := tabStr[0];
        end;
        if(tabStr[0] <> '0') then
        begin
          Edit2.Text := '1 / ' + tabStr[0];
          Edit1.Text := FloatToStr(1/StrToFloat(tabStr[0]));
        end else
        begin
          ShowMessage('Nie można dzielić przez 0!');
        end;
      end;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button17Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text = '0' then Edit1.Text := '2' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(tabStr[2] = '0') then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 2' else Edit1.Text := Edit1.Text + '2';
  end;
  removeFocusControl();
end;

procedure TForm1.Button18Click(Sender: TObject);
var
  tabStr:tabStringow;
begin
  if Edit1.Text = '0' then Edit1.Text := '3' else
  begin
    splitujString(Edit1.Text, tabStr);
    if(tabStr[2] = '0') then Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' 3' else Edit1.Text := Edit1.Text + '3';
  end;
  removeFocusControl();
end;

procedure TForm1.Button19Click(Sender: TObject);
var
  tabStr:tabStringow;
  wartosc:string;
begin
  if(Length(Edit1.Text) > 0) then
  begin
    if(liczbaSpacji(Edit1.Text) = 0) then
    begin
      wartosc := Edit1.Text;
      if(wartosc[Length(wartosc)] = ',') then
      begin
        Delete(wartosc,Length(wartosc),1);
        Edit1.Text := wartosc;
      end;
      Edit1.Text := Edit1.Text + ' - ';
    end else
    begin
      splitujString(Edit1.Text, tabStr);
      if(Length(tabStr[2]) > 0) then
      begin
        if(tabStr[2][Length(tabStr[2])] = ',') then
        begin
          Delete(tabStr[2],Length(tabStr[2]),1);
        end;
        if(wykonajDzialanie(Edit1.Text, wartosc)) then
        begin
          Edit2.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
          Edit1.Text := wartosc + ' - ';
        end;
      end else
      begin
        Edit1.Text := tabStr[0] + ' - ';
      end;
    end;
  end;
  removeFocusControl();
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  iloscSpacji:integer;
  tekst:string;
  tabStr:tabStringow;
begin
  iloscSpacji := liczbaSpacji(Edit1.Text);
  tekst:=Edit1.Text;
  if (Length(Edit1.Text)>0) then
  begin
    if (iloscSpacji = 0) then
    begin
      if((Length(tekst) = 2) and (tekst[1] = '-')) then
      begin
        tekst := '0';
      end else
      begin
        if((tekst[1] <> '0') or (Length(tekst) > 1)) then
        begin
          Delete(tekst,Length(Edit1.Text),1);
          if(Length(tekst) = 0) then tekst := '0';
        end;
      end;
    end else
    begin
      splitujString(Edit1.Text, tabStr);
      if(iloscSpacji = 2) and (Length(tabStr[2]) > 0) then
      begin
        if((Length(tabStr[2]) = 2) and (tabStr[2][1] = '-')) then Delete(tekst,(Length(tekst) - 1),2) else Delete(tekst,Length(tekst),1);
      end else
      begin
        Delete(tekst,(Length(tekst) - 2),3);
      end;
    end;
    Edit1.Text := tekst;
  end;
  removeFocusControl();
end;

procedure TForm1.Button20Click(Sender: TObject);
var
  tabStr:tabStringow;
  wartosc:string;
begin
  if(Length(Edit1.Text) > 0) then
  begin
    if(liczbaSpacji(Edit1.Text) = 0) then
    begin
      wartosc := Edit1.Text;
      if(wartosc[Length(wartosc)] = ',') then
      begin
        Delete(wartosc,Length(wartosc),1);
        Edit1.Text := wartosc;
      end;
      Edit1.Text := Edit1.Text + ' ^ ';
    end else
    begin
      splitujString(Edit1.Text, tabStr);
      if(Length(tabStr[2]) > 0) then
      begin
        if(tabStr[2][Length(tabStr[2])] = ',') then
        begin
          Delete(tabStr[2],Length(tabStr[2]),1);
          Edit1.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
        end;
        if(wykonajDzialanie(Edit1.Text, wartosc)) then
        begin
          Edit2.Text := tabStr[0] + ' ' + tabStr[1] + ' ' + tabStr[2];
          Edit1.Text := wartosc + ' ^ ';
        end;
      end else
      begin
        Edit1.Text := tabStr[0] + ' ^ ';
      end;
    end;
  end;
  removeFocusControl();
end;

end.

