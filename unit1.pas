unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ExtDlgs;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
Var x,y,z : integer;
     a : string;

 File1:TextFile;

begin
   AssignFile(File1,'Detekcja.csv');
   Label1.Caption:='Wait';

   Rewrite(File1);
  for y:=1 to image1.Width do  begin
      if y<image1.Width then Write(file1,'V'+inttostr(y)+',') else  Writeln(file1,'V'+inttostr(y))
  end;
  for y:=1 to image1.Height do  begin
      a:='';
      for x:=1 to image1.Width do begin
        z:=Image1.Canvas.Pixels[x, y];
       // memo1.Lines.Add(inttostr(x)+','+inttostr(y)+','+inttostr(z)+',');

        if x<image1.Width then
        a:=a+{inttostr(x)+','+inttostr(y)+','+}inttostr(z div 1000)+',' else
        a:=a+{inttostr(x)+','+inttostr(y)+','+}inttostr(z div 1000) ;

         end;
  writeln(file1,a);
     end;
  CloseFile(File1);
    Label1.Caption:='Done';

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if openpicturedialog1.Execute then
     image1.Picture.LoadFromFile(openpicturedialog1.FileName);
  Label1.Caption:='Loaded';
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

end.

