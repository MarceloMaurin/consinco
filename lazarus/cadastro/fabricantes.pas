unit fabricantes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  DBGrids;

type

  { TfrmFabricantes }

  TfrmFabricantes = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    SQLQuery1: TSQLQuery;
    SQLQuery1fabricante: TStringField;
    SQLQuery1idfabricante: TLongintField;
    SQLQuery1idmodelo1: TLongintField;
    SQLQuery1modelo1: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  frmFabricantes: TfrmFabricantes;

implementation

{$R *.lfm}

{ TfrmFabricantes }

procedure TfrmFabricantes.FormCreate(Sender: TObject);
begin

  SQLQuery1.open;
end;

procedure TfrmFabricantes.FormDestroy(Sender: TObject);
begin
  if (SQLQuery1.RowsAffected <> 0) then
  begin
    SQLQuery1.ApplyUpdates;
  end;
end;

end.

