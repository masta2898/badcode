unit pictures;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TPicturesForm }

  TPicturesForm = class(TForm)
    ShowCatButton: TButton;
    ShowFlowerButton: TButton;
    ShowStarButton: TButton;
    Picture: TImage;
    procedure ShowCatButtonClick(Sender: TObject);
    procedure ShowFlowerButtonClick(Sender: TObject);
    procedure ShowStarButtonClick(Sender: TObject);
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

procedure TPicturesForm.ShowFlowerButtonClick(Sender: TObject);
begin
  Picture.Picture.LoadFromFile('/home/john/Pictures/flower.jpg');
end;

procedure TPicturesForm.ShowStarButtonClick(Sender: TObject);
begin
  Picture.Picture.LoadFromFile('/home/john/Pictures/star.jpg');
end;

end.

