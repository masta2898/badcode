program task2;

var number, positiveNumberCount, negativeNumberCount: integer;
    inputFile, positivesOutputFile, netativesOutputFile: text;

begin
    assign(inputFile, 'input.txt');
    assign(positivesOutputFile, 'dod.txt');
    assign(netativesOutputFile, 'vid.txt');
    
    reset(inputFile);
    rewrite(positivesOutputFile);
    rewrite(netativesOutputFile);

    positiveNumberCount := 0;
    negativeNumberCount := 0;

    while not EOF(inputFile) do begin
        readln(inputFile, number);
        if number >= 0 then begin
            writeln(positivesOutputFile, number);
            positiveNumberCount := positiveNumberCount + 1;
        end
        else begin
            writeln(netativesOutputFile, number);
            negativeNumberCount := negativeNumberCount + 1;
        end;
    end;

    close(netativesOutputFile);
    close(positivesOutputFile);
    close(inputFile);

    writeln('Positives: ', positiveNumberCount);
    writeln('Negatives: ', negativeNumberCount);
end.