unit pictures;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TPicturesForm }

  TPicturesForm = class(TForm)
    ShowCastleButton: TButton;
    ShowCatButton: TButton;
    ShowFlowerButton: TButton;
    ShowStarButton: TButton;
    Picture: TImage;
    ShowLandscapeButton: TToggleBox;
    procedure ShowCastleButtonClick(Sender: TObject);
    procedure ShowCatButtonClick(Sender: TObject);
    procedure ShowFlowerButton1Click(Sender: TObject);
    procedure ShowLandscapeButtonChange(Sender: TObject);
    procedure ShowStarButton1Click(Sender: TObject);
  private

  public

  end;

var
  PicturesForm: TPicturesForm;

implementation

{$R *.lfm}

{ TPicturesForm }


procedure TPicturesForm.ShowCatButtonClick(Sender: TObject);
begin
  Picture.Picture.LoadFromFile('/home/john/Pictures/cat.jpg');
end;

procedure TPicturesForm.ShowCastleButtonClick(Sender: TObject);
begin
  Picture.Picture.LoadFromFile('/home/john/Pictures/castle');
end;

procedure TPicturesForm.ShowFlowerButton1Click(Sender: TObject);
begin
  Picture.Picture.LoadFromFile('/home/john/Pictures/flower.jpg');
end;

procedure TPicturesForm.ShowLandscapeButtonChange(Sender: TObject);
begin
  Picture.Picture.LoadFromFile('/home/john/Pictures/landscape.jpg');
end;

procedure TPicturesForm.ShowStarButton1Click(Sender: TObject);
begin
  Picture.Picture.LoadFromFile('/home/john/Pictures/star.jpg');
end;

end.

