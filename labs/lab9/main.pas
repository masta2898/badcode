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
  DropDb(connection);
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
    if GetById(studentsWithBadMarks, students.data[i].id).id = -1 then
      AppendStudent(studentsWithGoodMarks, students.data[i]);

  AppendStudents(connection, studentsWithGoodMarks);
  CloseDbConnection(connection);
end;

procedure PrintMenu();
begin
  WriteLn('Menu':10);
  WriteLn('1. Show all database.');
  WriteLn('2. Add new student.');
  WriteLn('3. Show students average marks.');
  WriteLn('4. Show students from 2005 year.');
  WriteLn('5. Show students with bad marks.');
  WriteLn('6. Remove students with bad marks from database.');
  WriteLn('7. Exit');
end;

procedure Main();
const DB_FILENAME = 'students.db';
var students, fromYearStudents, withMarkStudents: StudentsArray;
    s: Student;
    choose: Integer;
begin
  students := NewStudentsArray();

  while true do
  begin
    PrintMenu();
    Write('Enter menu item number> ');
    ReadLn(choose);

    if choose = 1 then
    begin
      students := LoadStudentsFromDb(DB_FILENAME);
      ShowStudents(students);
    end;

    if choose = 2 then
    begin
      s := ReadStudent();
      AppendStudent(students, s);
      SaveStudentsInDb(students, DB_FILENAME);
    end;

    if choose = 3 then
    begin
      ShowAverageMarks(students);
    end;

    if choose = 4 then
    begin
      fromYearStudents := GetByYear(students, 2005);
      ShowStudents(fromYearStudents);
    end;

    if choose = 5 then
    begin
      withMarkStudents := GetByMark(students, 2);
      ShowStudents(withMarkStudents);
    end;

    if choose = 6 then
    begin
      FilterBadMarks(DB_FILENAME);
    end;

    if choose = 7 then
      break;
  end;
  WriteLn('Goodbye!');
end;

begin
  Main();
end.