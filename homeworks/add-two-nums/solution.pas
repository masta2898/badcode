program addTwoNums;

const NUMBER_LEN = 41;
type number = array[1..NUMBER_LEN] of integer;
var num1, num2, sum: number;

procedure fill(var n: number; data: integer);
var i: integer;
begin
    for i := 1 to NUMBER_LEN do begin
        n[i] := data;
    end;
end;

function rawToNumber(raw: string): number;
var len, i, k: integer;
	n: number;
begin
    fill(n, 0);
	len := length(raw);
	for i := 1 to len do begin
        case raw[len-i+1] of
            '0': k := 0;
            '1': k := 1;
            '2': k := 2;
            '3': k := 3;
            '4': k := 4;
            '5': k := 5;
            '6': k := 6;
            '7': k := 7;
            '8': k := 8;
            '9': k := 9;
        end;
        n[i] := k;
    end;
	rawToNumber := n;
end;

procedure readNums(var n1, n2: number);
var n1Raw, n2Raw: string[NUMBER_LEN];
    inputFile: text;
begin
    assign(inputFile, 'input.txt');
    reset(inputFile);

    readln(inputFile, n1Raw);
    readln(inputFile, n2Raw);

    close(inputFile);

    n1 := rawToNumber(n1Raw);
    n2 := rawToNumber(n2Raw);
end;

procedure writeSum(n: number);
var i, k: integer;
    start: boolean;
    outputFile: text;
begin
    assign(outputFile, 'output.txt');
    rewrite(outputFile);

    start := false;
    for i := 1 to NUMBER_LEN do begin
        k := n[NUMBER_LEN-i+1];
        {truncates zeros at the beginning}
        if k > 0 then
            start := true;
        if start then
            write(outputFile, k);
    end;

    close(outputFile);
end;

function add(n1, n2: number): number;
var i, currentSum, currentNum, remainder: integer;
    sum: number;
begin
    fill(sum, 0);
    remainder := 0;
    for i := 1 to NUMBER_LEN do begin
        currentSum := n1[i] + n2[i] + remainder;
        currentNum := currentSum mod 10;
        remainder := currentSum div 10;
        sum[i] := currentNum;
    end;
    add := sum;
end;

begin
    fill(num1, 0);
    fill(num2, 0);
    fill(sum, 0);

    readNums(num1, num2);
    sum := add(num1, num2);
    writeSum(sum);
end.
