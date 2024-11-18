// TDSServerModule.pas

type
 TTasksServerMethods = class(TDataModule)
  procedure AddTask(const ATaskText: string; out AResult: Integer);
  procedure GetTasks(out ATasks: TJSONArray);
  procedure UpdateTask(ATaskID: Integer; const ATaskText: string; AIsCompleted: Boolean);
  procedure DeleteTask(ATaskID: Integer);
 private
  FTasksQuery: TSQLQuery;
 public
  procedure DataModuleCreate(Sender: TObject);
  procedure DataModuleDestroy(Sender: TObject);
 end;


implementation

uses
 Data.DB, System.JSON, FireDAC.Phys.MSSQL;


procedure TTasksServerMethods.DataModuleCreate(Sender: TObject);
begin
 FTasksQuery := TSQLQuery.Create(Self);
 FTasksQuery.Connection := TSQLConnection.Create(Self);
 FTasksQuery.Connection.Params.Add('Database=YourDatabaseName');
 FTasksQuery.Connection.Params.Add('Server=YourServerName');
 FTasksQuery.Connection.Params.Add('UID=YourUserName');
 FTasksQuery.Connection.Params.Add('PWD=YourPassword');
 FTasksQuery.Connection.Connected;
 FTasksQuery.SQL.Text := 'SELECT * FROM Tasks';
end;

procedure TTasksServerMethods.DataModuleDestroy(Sender: TObject);
begin
 FTasksQuery.Free;
end;


procedure TTasksServerMethods.AddTask(const ATaskText: string; out AResult: Integer);
begin
 FTasksQuery.SQL.Text := 'INSERT INTO Tasks (TaskText) VALUES (:TaskText)';
 FTasksQuery.ParamByName('TaskText').AsString := ATaskText;
 FTasksQuery.ExecSQL;
 AResult := FTasksQuery.LastInsertID;
end;

// ... (другие процедуры GetTasks, UpdateTask, DeleteTask аналогично)
