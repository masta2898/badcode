program main;

uses stud, database, view;

function LoadStudentsFromDb(dbFilename: string): StudentsArray;
var connection: DbConnection;
    students: StudentsArray;
begin
  connection := DbConnect(dbFilename);
  students := LoadStudents(connection);
  CloseDbConnection(connection);
  LoadStudentsFromDb := students;
end;

procedure SaveStudentsInDb(students: StudentsArray; dbFilename: string);
var connection: DbConnection;
begin
  connection := DbConnect(dbFilename);
  AppendStudents(connection, students);
  CloseDbConnection(connection);
end;

procedure FilterBadMarks(dbFilename: string);
var i: Integer;
  connection: DbConnection;
  students, studentsWithBadMarks, studentsWithGoodMarks: StudentsArray;
begin
  connection := DbConnect(dbFilename);
  students := LoadStudents(connection);
  studentsWithBadMarks := GetByMark(students, 2);
  DropDb(connection);

  for i := 0 to students.size - 1 do
    if GetById(studentsWithBadMarks, students.data[i].id).id <> -1 then
      AppendStudent(studentsWithGoodMarks, students.data[i]);

  AppendStudents(connection, studentsWithGoodMarks);
  CloseDbConnection(connection);
end;

procedure Main();
const DB_FILENAME = 'students.db';
var students: StudentsArray;
    s: Student;
    i: Integer;
begin
  s := ReadStudent();
  students := NewStudentsArray();
  AppendStudent(students, s);
  s := ReadStudent();
  AppendStudent(students, s);
  ShowStudents(students);
end;

begin
  Main();
end.