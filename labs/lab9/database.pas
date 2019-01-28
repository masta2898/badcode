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
  function IsActive(var connection: DbConnection): Boolean;

  {Loads all students from database}
  function LoadStudents(var connection: DbConnection): StudentsArray;

  {Appends students to the connected database. Adds information to original database content}
  procedure AppendStudents(var connection: DbConnection; students: StudentsArray);

  {Erases database content}
  procedure DropDb(var connection: DbConnection);

  {Closes active database connection}
  procedure CloseDbConnection(var connection: DbConnection);

implementation

  function DbConnect(dbFilename: string): DbConnection;
  var connection: DbConnection;
  begin
    Assign(connection.database, dbFilename);
    Reset(connection.database);
    Seek(connection.database, 0);

    connection.dbFilename := dbFilename;
    connection.active := true;

    DbConnect := connection;
  end;

  function IsActive(var connection: DbConnection): Boolean;
  begin
    IsActive := connection.active;
  end;

  function LoadStudents(var connection: DbConnection): StudentsArray;
  var i: Integer;
      s: Student;
      students: StudentsArray;
  begin
    Assert(IsActive(connection), 'Unable to load students from not connected database!');

    students := NewStudentsArray();
    for i := 0 to FileSize(connection.database) - 1 do
    begin
      Read(connection.database, s);
      AppendStudent(students, s);
    end;

    LoadStudents := students;
  end;

  procedure AppendStudents(var connection: DbConnection; students: StudentsArray);
  var i: Integer;
  begin
    Assert(IsActive(connection), 'Unable to append students to not connected database!');

    Seek(connection.database, FileSize(connection.database));
    for i := 0 to students.size - 1 do
      Write(connection.database, students.data[i]);
  end;

  procedure DropDb(var connection: DbConnection);
  begin
    Assert(IsActive(connection), 'Unable to drop not connected database!');

    CloseDbConnection(connection);

    {Opens database as file with content rewriting to erase previous data}
    Assign(connection.database, connection.dbFilename);
    Rewrite(connection.database);
    Seek(connection.database, 0);

    connection.active := true;
  end;

  procedure CloseDbConnection(var connection: DbConnection);
  begin
    if IsActive(connection) then
      Close(connection.database);
    connection.active := false;
  end;

end.
