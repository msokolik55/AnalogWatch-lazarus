program project1;
uses wincrt, graph;

var gd, gm: smallint;

procedure sekundovaRucicka(sekundy, r, x1, y1: integer; nakreslit: boolean);
var okraj: integer;
begin
  okraj := 20;

  if(nakreslit) then setcolor(red)
  else setcolor(black);

  case sekundy of 
    0: line(x1, y1, x1, okraj);
    1: line(x1, y1, x1 + r - okraj, y1);
    2: line(x1, y1, x1, 2 * y1 - okraj);
    3: line(x1, y1, x1 - r + okraj, y1);
  end;
end;

procedure minutovaRucicka(minuty, r, x1, y1: integer; nakreslit: boolean);
var okraj: integer;
begin
  okraj := 5 * 20;

  if(nakreslit) then setcolor(green)
  else setcolor(black);

  case minuty of
    0: line(x1, y1, x1, okraj);
    1: line(x1, y1, x1 + r - okraj, y1);
    2: line(x1, y1, x1, 2 * y1 - okraj);
    3: line(x1, y1, x1 - r + okraj, y1);
  end;
end;

procedure hodinovaRucicka(hodiny, r, x1, y1: integer; nakreslit: boolean);
var okraj: integer;
begin
  okraj := 10 * 20;

  if(nakreslit) then setcolor(blue)
  else setcolor(black);

  case hodiny of
    0: line(x1, y1, x1, okraj);
    1: line(x1, y1, x1 + r - okraj, y1);
    2: line(x1, y1, x1, 2 * y1 - okraj);
    3: line(x1, y1, x1 - r + okraj, y1);
  end;
end;

procedure uloha_hodiny;
var sekundy, minuty, hodiny, interval, r: integer;
    stred: array [1..2] of integer;
    ch: char;
begin
  stred[1] := getmaxx div 2;
  stred[2] := getmaxy div 2;
  r := stred[2] - 1;
  circle(stred[1], stred[2], r);

  sekundy := 0; 
  minuty := 0;
  hodiny := 0;
  interval := 1;

  repeat
    // vykreslenie ruciciek
    sekundovaRucicka(sekundy mod (4 * interval), r, stred[1], stred[2], True);
    minutovaRucicka(minuty mod (4 * interval), r, stred[1], stred[2], True);
    hodinovaRucicka(hodiny mod (4 * interval), r, stred[1], stred[2], True);

    delay(500);
    if(keypressed) then ch := readkey;

    if(ch <> chr(13)) then
    begin
      // vymazanie ruciciek
      sekundovaRucicka(sekundy mod (4 * interval), r, stred[1], stred[2], False);
      minutovaRucicka(minuty mod (4 * interval), r, stred[1], stred[2], False);
      hodinovaRucicka(hodiny mod (4 * interval), r, stred[1], stred[2], False);
    end;

    sekundy := sekundy + interval;
    if(sekundy mod (4 * interval) = 0) then minuty := minuty + 1;
    if(minuty mod (4 * interval) = 0) and (sekundy mod (4 * interval) = 0) then hodiny := hodiny + 1;
  until ch = chr(13);

  setcolor(white);
  outtextxy(stred[1] - 100, stred[2], 'Prave teraz si stopol cas');
end;

begin
  gd := detect;
  initgraph(gd, gm, '');

  uloha_hodiny;

  delay(5000);
  closegraph;
end.

