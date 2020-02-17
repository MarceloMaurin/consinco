unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, Forms, Controls, Graphics, Dialogs,
  Menus, StdCtrls, modelos, fabricantes, categorias, equipamentos,
  rcategoria, rcadmaq;

const
  versao = '0.2 Betha';

type

  { Tfrmmain }

  Tfrmmain = class(TForm)
    Label1: TLabel;
    lbversao: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    SQLite3Connection1: TSQLite3Connection;
    SQLTransaction1: TSQLTransaction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private

  public

  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.lfm}

{ Tfrmmain }

procedure Tfrmmain.MenuItem2Click(Sender: TObject);
begin
  frmmodelos := tfrmmodelos.create(self);
  frmmodelos.ShowModal();
  frmmodelos.free;
end;

procedure Tfrmmain.MenuItem3Click(Sender: TObject);
begin
  frmFabricantes := TfrmFabricantes.create(self);
  frmFabricantes.ShowModal();
  frmFabricantes.free;
end;

procedure Tfrmmain.MenuItem4Click(Sender: TObject);
begin
  frmCategorias := TfrmCategorias.create(self);
  frmCategorias.showmodal();
  frmCategorias.free;
end;

procedure Tfrmmain.MenuItem6Click(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.create(self);
  frmEquipamentos.showmodal();
  frmEquipamentos.free;
end;

procedure Tfrmmain.MenuItem8Click(Sender: TObject);
begin
  frmRCategoria := TfrmRCategoria.create(self);
  frmRCategoria.Imprime();
  frmRCategoria.free;
end;

procedure Tfrmmain.MenuItem9Click(Sender: TObject);
begin
  frmRCadmaq := TfrmRcadmaq.create(self);
  frmRcadmaq.Imprime();
  frmRCadmaq.free;

end;

procedure Tfrmmain.FormCreate(Sender: TObject);
begin
  SQLite3Connection1.Connected:= true;
  SQLTransaction1.Active:= true;
  lbversao.Caption:= versao;
end;

procedure Tfrmmain.FormDestroy(Sender: TObject);
begin
  SQLTransaction1.Commit;
  SQLTransaction1.Active:= false;
  SQLite3Connection1.Connected:= false;

end;

end.

