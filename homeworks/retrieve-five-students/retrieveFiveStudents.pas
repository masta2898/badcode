program retrieveFiveStudents;

uses stud, database;

function ReadMarks(): MarksArray;
var i: Integer;
    marks: MarksArray;
begin
  for i := 1 to Length(marks) do
  begin
    Write('Enter ', i, ' mark: ');
    ReadLn(marks[i]);
  end;
  ReadMarks := marks;
end;

function ReadStudents(count: Integer): StudentsArray;
var i: Integer;
    name: string;
    year: Integer;
    marks: MarksArray;
    currentStudent: Student;
    students: StudentsArray;
begin
  for i := 1 to count do
  begin
    Write('Enter student name: ');
    ReadLn(name);
    Write('Enter student year: ');
    ReadLn(year);

    marks := ReadMarks();

    currentStudent := NewStudent(name, year, marks);
    AppendStudent(students, currentStudent);
  end;

  ReadStudents := students;
end;

procedure SaveStudentsInDb(students: StudentsArray);
const DB_FILENAME = 'students.db';
var connection: DbConnection;
begin
  connection := DbConnect(DB_FILENAME);
  if IsActive(connection) then
  begin
    SaveStudents(connection, students);
    CloseDbConnection(connection);
  end
  else begin
    WriteLn('Error connecting to the database by filename: ', DB_FILENAME);
  end;
end;

procedure Main();
const FIRST_STUDENTS_COUNT = 5;
      SECOND_STUDENTS_COUNT = 3;
var students: StudentsArray;
    i: Integer;
begin
  WriteLn('Enter 5 students');
  students := ReadStudents(FIRST_STUDENTS_COUNT);

  for i := 0 to FIRST_STUDENTS_COUNT - 1 do
    WriteLn(students.data[i].name, ' average mark is: ', GetAverageMark(students.data[i]):1:3);

  WriteLn('Enter additional 3 students');
  students := ReadStudents(SECOND_STUDENTS_COUNT);
  SaveStudentsInDb(students);
end;

begin
  Main();
end.