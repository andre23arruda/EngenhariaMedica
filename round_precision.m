function new = round_precision(n,spaces)
  entire = fix(n);
  decimal = n - entire;
  spaces = 10^spaces;
  decimal = round(decimal*spaces);
  decimal = decimal/spaces;
  new = entire + decimal;
end
