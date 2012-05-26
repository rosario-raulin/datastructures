module: symbol-tables

define function test-client (entries :: <vector>) => ()
  let table :: <symbol-table> = make(<list-table>);

  for (entry :: <string> in entries, i :: <integer> from 0)
    table.put(entry, i);
  end for;

  for (key in table.keys())
    format-out("%s - %d\n", key, table.get(key));
  end for;
end function test-client;
