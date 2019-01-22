program task3;

const NUMBER_LEN = 41;
type number = array[1..NUMBER_LEN] of integer;
var num1, num2, sum: number;
    i: integer;

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

procedure readNums(var a, b: number);
var aRaw, bRaw: string[NUMBER_LEN];
    inputFile: text;
begin
    assign(inputFile, 'dani.txt');
    reset(inputFile);

    readln(inputFile, aRaw);
    readln(inputFile, bRaw);

    close(inputFile);

    a := rawToNumber(aRaw);
    b := rawToNumber(bRaw);
end;

procedure printNumber(num: number);
var i, n: integer;
    start: boolean;
begin
    start := false;
    for i := 1 to NUMBER_LEN do begin
        n := num[NUMBER_LEN-i+1];
        {truncates zeros at the beginning}
        if n > 0 then
            start := true;
        if start then
            write(n)
        else
            write(' ');
    end;
    writeln();
end;

function add(a, b: number): number;
var i, currentSum, currentNum, remainder: integer;
    sum: number;
begin
    fill(sum, 0);
    remainder := 0;
    for i := 1 to NUMBER_LEN do begin
        currentSum := a[i] + b[i] + remainder;
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
    
    printNumber(num1);
    writeln('+');
    printNumber(num2);
    for i := 1 to NUMBER_LEN+1 do
        write('-');
    writeln();
    printNumber(sum);
end.
