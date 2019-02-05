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
  private

  public

  end;

var
  NastyButtonForm: TNastyButtonForm;

implementation

{$R *.lfm}

{ TNastyButtonForm }

end.

