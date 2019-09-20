object MainForm: TMainForm
  Left = 159
  Top = 56
  BorderStyle = bsDialog
  Caption = 'Brownian motion'
  ClientHeight = 508
  ClientWidth = 765
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object label1: TLabel
    Left = 8
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Time (ms):'
  end
  object BGImg: TImage
    Left = 192
    Top = 0
    Width = 569
    Height = 505
    AutoSize = True
  end
  object PaintBox1: TPaintBox
    Left = 192
    Top = 0
    Width = 569
    Height = 505
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CalculateButton: TButton
    Left = 8
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Calculate'
    TabOrder = 0
    OnClick = CalculateButtonClick
  end
  object te: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object ExitButton: TButton
    Left = 104
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 2
    OnClick = ExitButtonClick
  end
  object progr: TProgressBar
    Left = 7
    Top = 85
    Width = 169
    Height = 16
    Min = 0
    Max = 1000
    Step = 1
    TabOrder = 3
  end
end
