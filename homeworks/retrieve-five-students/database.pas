unit database;

interface
  uses stud;

  type DbConnection = record
      dbFilename: string;
      database: file of Student;
      active : Boolean;
    end;

  {Creates database connection}
  function DbConnect(dbFilename: string): DbConnection;

  {Checks connection status. Typical property getter}
  function IsActive(connection: DbConnection): Boolean;

  {Saves students to the connected database.
   Adds information to original database content}
  procedure SaveStudents(connection: DbConnection; students: StudentsArray);

  {Closes active database connection}
  procedure CloseDbConnection(connection: DbConnection);

implementation

  function DbConnect(dbFilename: string): DbConnection;
  var connection: DbConnection;
  begin
    Assign(connection.database, dbFilename);
    Rewrite(connection.database);

    connection.dbFilename := dbFilename;
    connection.active := true;

    DbConnect := connection;
  end;

  function IsActive(connection: DbConnection): Boolean;
  begin
    IsActive := connection.active;
  end;

  procedure SaveStudents(connection: DbConnection; students: StudentsArray);
  var i: Integer;
  begin
    Assert(IsActive(connection), 'Not connected to the database!');

    Seek(connection.database, FileSize(connection.database));
    for i := 0 to students.size - 1 do
      Write(connection.database, students.data[i]);
  end;

  procedure CloseDbConnection(connection: DbConnection);
  begin
    if IsActive(connection) then
      Close(connection.database);
    connection.active := false;
  end;

end.