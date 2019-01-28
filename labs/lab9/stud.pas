unit stud;

interface

  type
    MarksArray = array[1..3] of Integer;

    Student = record
      id: Integer;
      name: string[20];
      year: Integer;
      marks: MarksArray;
    end;

    StudentsArray = record
      size: Integer;
      data: array of Student;
    end;

  {Creates new instance of Student}
  function NewStudent(name: string; year: Integer; marks: MarksArray): student;

  {Creates new instance of Student}
  function NewStudent(id: Integer; name: string; year: Integer; marks: MarksArray): student;

  {Creates new students array}
  function NewStudentsArray(): StudentsArray;

  {Creates new students array and allocates specified size of blocks}
  function NewStudentsArray(allocSize: Integer): StudentsArray;

  {Appends student to the students array}
  procedure AppendStudent(var students: StudentsArray; s: student);

  {Searches for student by id. Returns instance of Student with id = -1 if student not found}
  function GetById(students: StudentsArray; id: Integer): Student;

  {Searches for students with sepecified mark. Returns empty StudentsArray (size = 0) if no any student found}
  function GetByMark(students: StudentsArray; mark: Integer): StudentsArray;

  {Searches for students with specified name. Returns empty StudentsArray (size = 0) if no any student found}
  function GetByName(students: StudentsArray; name: string): StudentsArray;

  {Calculates an average mark for student}
  function GetAverageMark(s: student): Real;

implementation

  function NewStudent(name: string; year: Integer; marks: MarksArray): Student;
  begin
    NewStudent := NewStudent(-1, name, year, marks);
  end;

  function NewStudent(id: Integer; name: string; year: Integer; marks: MarksArray): Student;
  var s: Student;
  begin
    s.id := id;
    s.name := name;
    s.year := year;
    s.marks := marks; {idk how to copy arrays in pascal correctly}
    NewStudent := s;
  end;

  function NewStudentsArray(): StudentsArray;
  begin
    NewStudentsArray := NewStudentsArray(8);
  end;

  function NewStudentsArray(allocSize: Integer): StudentsArray;
  var students: StudentsArray;
  begin
    students.size := 0;
    SetLength(students.data, allocSize);
    NewStudentsArray := students;
  end;

  procedure AppendStudent(var students: StudentsArray; s: Student);
  const ALLOC_BY = 10;
  var actualSize: Integer;
  begin
    Assert(GetById(students, s.id).id <> -1, 'Student already exists!');

    actualSize := Length(students.data);
    if students.size = actualSize then
      SetLength(students.data, actualSize + ALLOC_BY);

    if s.id = -1 then
      if students.size = 0 then
        s.id := 0
      else
        s.id := students.data[students.size-1].id + 1;

    students.data[students.size] := s;
    inc(students.size);
  end;

  function GetById(students: StudentsArray; id: Integer): Student;
  var i: Integer;
      noStudentFound: Student;
  begin
    noStudentFound.id := -1;
    GetById := noStudentFound;

    for i := 0 to students.size - 1 do
      if students.data[i].id = id then
      begin
        GetById := students.data[i];
        break;
      end;
  end;

  function GetByMark(students: StudentsArray; mark: Integer): StudentsArray;
  var i, m: Integer;
      studentsWithMark: StudentsArray;
  begin
    for i := 0 to students.size - 1 do
      for m := 1 to Length(students.data[i].marks) do
        if students.data[i].marks[m] = mark then
          AppendStudent(studentsWithMark, students.data[i]);

    GetByMark := studentsWithMark;
  end;

  function GetByName(students: StudentsArray; name: string): StudentsArray;
  var i: Integer;
      studentsWithName: StudentsArray;
  begin
    for i := 0 to students.size - 1 do
      if students.data[i].name = name then
        AppendStudent(studentsWithName, students.data[i]);

    GetByName := studentsWithName;
  end;

  function GetAverageMark(s: Student): Real;
  var i, sum, marksNumber: Integer;
  begin
    sum := 0;
    marksNumber := Length(s.marks);
    for i := 1 to marksNumber do
      sum := sum + s.marks[i];
    GetAverageMark := sum / marksNumber;
  end;

end.