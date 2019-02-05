unit colors;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TColorsForm }

  TColorsForm = class(TForm)
    WhiteButton: TButton;
    GrayButton: TButton;
    BlackButton: TButton;
    RedButton: TButton;
    OrangeButton: TButton;
    YellowButton: TButton;
    GreenButton: TButton;
    BlueButton: TButton;
    PurlpeButton: TButton;
    VioletButton: TButton;
    procedure BlackButtonClick(Sender: TObject);
    procedure BlueButtonClick(Sender: TObject);
    procedure GrayButtonClick(Sender: TObject);
    procedure GreenButtonClick(Sender: TObject);
    procedure OrangeButtonClick(Sender: TObject);
    procedure PurlpeButtonClick(Sender: TObject);
    procedure RedButtonClick(Sender: TObject);
    procedure VioletButtonClick(Sender: TObject);
    procedure WhiteButtonClick(Sender: TObject);
    procedure YellowButtonClick(Sender: TObject);
  private

  public

  end;

var
  ColorsForm: TColorsForm;

implementation

{$R *.lfm}

{ TColorsForm }


procedure TColorsForm.WhiteButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clWhite;
end;

procedure TColorsForm.YellowButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clYellow;
end;

procedure TColorsForm.BlackButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clBlack;
end;

procedure TColorsForm.BlueButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clBlue;
end;

procedure TColorsForm.GrayButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clGray;
end;

procedure TColorsForm.GreenButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clGreen;
end;

procedure TColorsForm.OrangeButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clOlive;
end;

procedure TColorsForm.PurlpeButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clPurple;
end;

procedure TColorsForm.RedButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clRed;
end;

procedure TColorsForm.VioletButtonClick(Sender: TObject);
begin
  ColorsForm.Color := clFuchsia;
end;

end.

