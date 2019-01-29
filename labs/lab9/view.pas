unit view;

interface
  uses stud, database;

  {Reads student information and returns created instance}
  function ReadStudent(): Student;

  {Shows information about student using pretty output}
  procedure ShowStudent(s: Student);

  {Shows repeated names and repeating count for each of them}
  procedure ShowRepeatedNames(students: StudentsArray);

  {Shows average marks for each student in students array}
  procedure ShowAverageMarks(students: StudentsArray);

  {Shows students}
  procedure ShowStudents(students: StudentsArray);

implementation
  type
    NameNumberPair = record
      name: string;
      repeatNumber: Integer;
    end;

    RepeatingNamesMap = record
      size: Integer;
      data: array of NameNumberPair;
    end;

  procedure AppendName(var names: RepeatingNamesMap; name: string);
  const ALLOC_BY = 10;
  var actualSize: Integer;
    i: Integer;
  begin
    for i := 0 to names.size - 1 do
      if names.data[i].name = name then
      begin
        inc(names.data[i].repeatNumber);
        exit;
      end;

    actualSize := Length(names.data);
    if names.size = actualSize then
      SetLength(names.data, actualSize + ALLOC_BY);

    names.data[names.size].name := name;
    names.data[names.size].repeatNumber := 1;
    inc(names.size);
  end;

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

  function ReadStudent(): Student;
  var name: string;
      year: Integer;
  begin
    Write('Enter student name: ');
    ReadLn(name);
    Write('Enter student year: ');
    ReadLn(year);

    ReadStudent := NewStudent(name, year, ReadMarks());
  end;

  procedure PrintBorder(size: Integer);
  var i: Integer;
  begin
    Write('+');
    for i := 1 to size do
      Write('-');
    WriteLn('+');
  end;

  procedure PrintHeader();
  var i, nameSize, marksSize, borderSize: Integer;
  begin
    nameSize := 12; {average value, too lazy to calculate exact size}
    marksSize := 2 + 1 + 3 + 1;
    borderSize := 1 + 3 + 1 + nameSize + 1 + 4 + marksSize;

    PrintBorder(borderSize);
    Write('| ID|');
    for i := 1 to nameSize - 4 do Write(' ');
    Write('NAME|YEAR|');
    for i := 1 to marksSize - 5 do Write(' ');
    WriteLn('MARKS|');
    PrintBorder(borderSize);
  end;

  procedure ShowStudent(s: Student);
  var students: StudentsArray;
  begin
    students := NewStudentsArray(1);
    AppendStudent(students, s);
    ShowStudents(students);
  end;

  procedure ShowAverageMarks(students: StudentsArray);
  var i, nameSize, markSize, borderSize: Integer;
  begin
    nameSize := 10; {average value, too lazy to calculate exact size}
    markSize := 2 + 1 + 3 + 1;
    borderSize := 3 + nameSize + markSize;

    PrintBorder(borderSize);
    Write('| ID|');
    for i := 1 to nameSize - 4 do Write(' ');
    WriteLn('NAME| MARK|');
    PrintBorder(borderSize);

    for i := 0 to students.size - 1 do
      with students.data[i] do
      begin
        WriteLn('|', id:3, '|', name:nameSize, '|', GetAverageMark(students.data[i]):3:3, '|');
      end;

    PrintBorder(borderSize);
  end;

  procedure ShowStudents(students: StudentsArray);
  var i, j, nameSize, marksSize, borderSize: Integer;
  begin
    nameSize := 12; {average value, too lazy to calculate exact size}
    marksSize := 2 + 1 + 3 + 1;
    borderSize := 1 + 3 + 1 + nameSize + 1 + 4 + marksSize;

    PrintHeader();

    for i := 0 to students.size - 1 do
      with students.data[i] do
      begin
        Write('|', id:3, '|', name:nameSize, '|', year:4, '|');
        for j := 1 to Length(marks) do Write(marks[j]:2);
        WriteLn(' |');
      end;

    PrintBorder(borderSize);
  end;

  procedure ShowRepeatedNames(students: StudentsArray);
  var i: Integer;
      repeatingNames: RepeatingNamesMap;
  begin
	repeatingNames.size := 0;
	SetLength(repeatingNames.data, 8);

    for i := 0 to students.size - 1 do
      AppendName(repeatingNames, students.data[i].name);

    for i := 0 to repeatingNames.size - 1 do
	  if repeatingNames.data[i].repeatNumber > 1 then
        WriteLn(repeatingNames.data[i].name:20, ' repeats ', repeatingNames.data[i].repeatNumber:5, ' times.');
  end;

end.
