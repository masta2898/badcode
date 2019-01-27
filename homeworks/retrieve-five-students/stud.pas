unit stud;

interface

  type
    MarksArray = array[1..3] of Integer;

    Student = record
      name: string;
      year: Integer;
      marks: MarksArray;
    end;

    StudentsArray = record
      size: Integer;
      data: array of Student;
    end;

  {Creates new instance of Student}
  function NewStudent(name: string; year: Integer; marks: MarksArray): student;

  {Appends student to the students array}
  procedure AppendStudent(var students: StudentsArray; s: student);

  {Calculates an average mark for student}
  function GetAverageMark(s: student): Real;

implementation

  function NewStudent(name: string; year: Integer; marks: MarksArray): Student;
  var s: Student;
  begin
    s.name := name;
    s.year := year;
    s.marks := marks; {idk how to copy arrays in pascal correctly}
    NewStudent := s;
  end;

  procedure AppendStudent(var students: StudentsArray; s: Student);
  const ALLOC_BY = 10;
  var actualSize: Integer;
  begin
    actualSize := Length(students.data);
    if students.size = actualSize then
      SetLength(students.data, actualSize + ALLOC_BY);

    students.data[students.size] := s;
    inc(students.size);
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