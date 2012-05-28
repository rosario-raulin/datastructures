module: symbol-tables-test

define constant $test-client-words :: <vector>
  = #["S", "E", "A", "R", "C", "H", "E", "X", "A", "M", "P", "L", "E"];

define function test-client (table :: <symbol-table>) => ()
  for (word :: <string> in $test-client-words, i :: <integer> from 0)
    put!(table, word, i);
  end for;

  case
    get(table, "E") ~= 12
      => error("E's value: %d", get(table, "E"));
    get(table, "S") ~= 0
      => error("S's value: %d", get(table, "S"));
    get(table, "A") ~= 8
      => error("A's value: %d", get(table, "A"));
    get-size(table) ~= 10
      => error("get-size(table) = %d", get-size(table));
    ~ contains?(table, "X")
      => error("X should be in the table");
    contains?(table, "42")
      => error("42 shouldn't be there...");
    get-size(keys(table)) ~= 10
      => error("get-size(keys(table)) = %d", get-size(keys(table)));
  end case;
end function test-client;
