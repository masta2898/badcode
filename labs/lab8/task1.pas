program task1;

var sum, number, numberCount: integer;
    middleNum: real;
    inputFile: text;

begin
    assign(inputFile, 'input.txt');
    reset(inputFile);

    sum := 0; numberCount := 0;
    while not EOF(inputFile) do begin
        readln(inputFile, number);
        sum := sum + number;
        numberCount := numberCount + 1;
    end;

    close(inputFile);

    middleNum := sum / numberCount;
    
    writeln('Sum: ', sum);
    writeln('Middle num: ', middleNum:5:3);
end.
