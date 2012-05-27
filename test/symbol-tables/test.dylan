module: symbol-tables-test

define function run-symbol-tables-test () => ()
  test-client(make(<list-table>));
  format-out("<list-table> test passed.\n");

  test-client(make(<binary-search-tree>));
  format-out("<binary-search-tree> test passed.\n");
end function run-symbol-tables-test;
