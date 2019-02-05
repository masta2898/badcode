unit sum;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCalculatorForm }

  TCalculatorForm = class(TForm)
    AddButton: TButton;
    DivideButton: TButton;
    MulButton: TButton;
    SubButton: TButton;
    firstNumberField: TEdit;
    aLabel: TLabel;
    bLabel: TLabel;
    secondNumberField: TEdit;
    procedure AddButtonClick(Sender: TObject);
    procedure DivideButtonClick(Sender: TObject);
    procedure MulButtonClick(Sender: TObject);
    procedure SubButtonClick(Sender: TObject);
  private
    procedure GetNumbers(var a, b: Integer);
  public

  end;

var
  CalculatorForm: TCalculatorForm;

implementation

{$R *.lfm}

{ TCalculatorForm }
procedure TCalculatorForm.GetNumbers(var a, b: Integer);
begin
  a := StrToInt(firstNumberField.Text);
  b := StrToInt(secondNumberField.Text);
end;

procedure TCalculatorForm.AddButtonClick(Sender: TObject);
var a, b, sum: integer;
begin
  GetNumbers(a, b);
  sum := a + b;
  ShowMessage('A + B = ' + IntToStr(sum));
end;

procedure TCalculatorForm.DivideButtonClick(Sender: TObject);
var a, b, division: Integer;
begin
  GetNumbers(a, b);
  division := a div b;
  ShowMessage('A / B = ' + IntToStr(division));
end;

procedure TCalculatorForm.MulButtonClick(Sender: TObject);
var a, b, mul: Integer;
begin
  GetNumbers(a, b);
  mul := a * b;
  ShowMessage('A * B = ' + IntToStr(mul));
end;

procedure TCalculatorForm.SubButtonClick(Sender: TObject);
var a, b, sub: Integer;
begin
  GetNumbers(a, b);
  sub := a - b;
  ShowMessage('A - B = ' + IntToStr(sum));
end;

end.

