unit Principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, BGRABitmap;

type

  { TForm1 }

  TForm1 = class(TForm)
    LPos: TLabel;
    SBar: TStatusBar;
    TBar: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure TBarChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Bm1,Bm2: TBGRABitmap;
  P1,P2: array of TPoint;

implementation

{$R *.frm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  //los polígonos:
  SetLength(P1,4);
  SetLength(P2,4);
  P1[0]:=Point(20,20);
  P1[1]:=Point(20,100);
  P1[2]:=Point(100,100);
  P1[3]:=Point(100,20);
  P2[0]:=Point(60,60);
  P2[1]:=Point(60,150);
  P2[2]:=Point(150,150);
  P2[3]:=Point(150,60);
  //se crean instancias:
  Bm1:=TBGRABitmap.Create;
  Bm2:=TBGRABitmap.Create;
  //se establece el tamaño del bitmap:
  Bm1.SetSize(Width,Height);
  Bm2.SetSize(Width,Height);
  //el color:
  Bm1.Canvas.Brush.Color:=clBlue;
  Bm2.Canvas.Brush.Color:=clYellow;
  //el grado de opacidad (0-255):
  Bm1.CanvasOpacity:=TBar.Position;
  Bm2.CanvasOpacity:=TBar.Position;

  LPos.Caption:=IntToStr(TBar.Position)+' ('+
    IntToStr(TBar.Position*100 div TBar.Max)+'%)';
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  SetLength(P1,0);
  SetLength(P2,0);
  Bm1.Free;          //se liberan de la memoria
  Bm2.Free;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  SBar.SimpleText:=' X: '+IntToStr(X)+' / Y: '+IntToStr(Y);
  Bm1.Canvas.EllipseC(X,Y,15,15);
  Invalidate;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  Bm1.Canvas.Polygon(P1);
  Bm1.Draw(Canvas,0,0,false);
  Bm2.Canvas.Polygon(P2);
  Bm2.Draw(Canvas,0,0,false);
end;

procedure TForm1.TBarChange(Sender: TObject);
begin
  LPos.Caption:=IntToStr(TBar.Position)+' ('+
    IntToStr(TBar.Position*100 div TBar.Max)+'%)';
  Bm1.CanvasOpacity:=TBar.Position;
  Bm2.CanvasOpacity:=TBar.Max-TBar.Position;
  Invalidate;
end;

end.
