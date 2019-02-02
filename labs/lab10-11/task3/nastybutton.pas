unit nastybutton;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TNastyButtonForm }

  TNastyButtonForm = class(TForm)
    aSimpleButton: TButton;
    aNastyButton: TButton;
    procedure aNastyButtonMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private

  public

  end;

var
  NastyButtonForm: TNastyButtonForm;

implementation

{$R *.lfm}

{ TNastyButtonForm }

procedure TNastyButtonForm.aNastyButtonMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  aNastyButton.Top := aNastyButton.Top + X;
  aNastyButton.Left := aNastyButton.Left + Y;
end;

end.

