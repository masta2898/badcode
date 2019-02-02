unit sum;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TSumForm }

  TSumForm = class(TForm)
    calculateButton: TButton;
    firstNumberField: TEdit;
    aLabel: TLabel;
    bLabel: TLabel;
    plusLabel: TLabel;
    equalLabel: TLabel;
    answerLabel: TLabel;
    secondNumberField: TEdit;
    procedure calculateButtonClick(Sender: TObject);
  private

  public

  end;

var
  SumForm: TSumForm;

implementation

{$R *.lfm}

{ TSumForm }

procedure TSumForm.calculateButtonClick(Sender: TObject);
var a, b, sum: integer;
begin
     a := StrToInt(firstNumberField.Text);
     b := StrToInt(secondNumberField.Text);
     sum := a + b;
     answerLabel.Caption := IntToStr(sum);
end;

end.

