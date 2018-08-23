object Form1: TForm1
  Left = 255
  Height = 256
  Top = 219
  Width = 258
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Transparencia'
  ClientHeight = 256
  ClientWidth = 258
  Color = clWhite
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseMove = FormMouseMove
  OnPaint = FormPaint
  Position = poScreenCenter
  LCLVersion = '6.3'
  object TBar: TTrackBar
    Left = 48
    Height = 25
    Top = 200
    Width = 96
    Max = 255
    OnChange = TBarChange
    Position = 50
    TabOrder = 0
  end
  object LPos: TLabel
    Left = 168
    Height = 15
    Top = 204
    Width = 6
    Caption = '0'
    ParentColor = False
  end
  object SBar: TStatusBar
    Left = 0
    Height = 23
    Top = 233
    Width = 258
    Panels = <>
    SimpleText = 'XX'
  end
end
