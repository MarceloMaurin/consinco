unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, Forms, Controls, Graphics, Dialogs,
  Menus, modelos, fabricantes, categorias, equipamentos;

type

  { Tfrmmain }

  Tfrmmain = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    SQLite3Connection1: TSQLite3Connection;
    SQLTransaction1: TSQLTransaction;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
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

procedure Tfrmmain.FormCreate(Sender: TObject);
begin
  SQLite3Connection1.Connected:= true;
end;

end.

