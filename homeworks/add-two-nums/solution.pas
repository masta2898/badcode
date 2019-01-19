program addTwoNums;

uses sysutils;

const NUMBER_LEN = 41;

type number = array[1..NUMBER_LEN] of integer;

var num1, num2, sum: number;

procedure printNumber(n: number);
var i: integer;
begin
    for i := 1 to NUMBER_LEN do begin
        write(n[i]);
    end;
    writeln();
end;

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
        if k > 0 then
            start := true;
        if start then
            write(outputFile, k);
    end;

    close(outputFile);
end;

function add(n1, n2: number): number;
var i: integer;
    sum: number;
begin
    fill(sum, 0);
    add := rawToNumber('445');
end;

procedure test();
{test business logic}
var nr1, nr2, sr: string;
    n1, n2, s, se: number;
begin
    nr1 := '123';
    nr2 := '321';
    sr := '444';
    se := rawToNumber(sr);
    n1 := rawToNumber(nr1);
    n2 := rawToNumber(nr2);
    s := add(n1, n2);
    write('n1: '); printNumber(n1);
    write('n2: '); printNumber(n2);
    write('s : '); printNumber(s);
    write('se: '); printNumber(se);
end;

begin
    fill(num1, 0);
    fill(num2, 0);
    fill(sum, 0);
    
    readNums(num1, num2);
    sum := add(num1, num2);
    writeSum(sum);

    test();
end.