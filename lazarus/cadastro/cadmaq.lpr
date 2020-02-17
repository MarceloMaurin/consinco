program cadmaq;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, fortes324forlaz, zcomponent, main, modelos, fabricantes, categorias,
  equipamentos, RCategoria, RCadmaq
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(TfrmRCategoria, frmRCategoria);
  Application.CreateForm(TfrmRCadmaq, frmRCadmaq);
  Application.Run;
end.

