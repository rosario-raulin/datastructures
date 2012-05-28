module: st-performance-test

define variable *comparisons* :: <integer> = 0;

define class <logging-string> (<object>)
  constant slot content :: <string>, required-init-keyword: content:;
end class <logging-string>;

define method \=
    (s1 :: <logging-string>, s2 :: <logging-string>) => (equal-p :: <boolean>)
  *comparisons* := *comparisons* + 1;
  content(s1) = content(s2)
end method \=;

define method \<
    (s1 :: <logging-string>, s2 :: <logging-string>) => (less-p :: <boolean>)
  *comparisons* := *comparisons* + 1;
  content(s1) < content(s2)
end method \<;

define function tokenize-into-words (input :: <string>)
 => (words :: <iterable>)
  local method space? (c :: <character>) => (space-p :: <boolean>)
          any?(curry(\=, c), #(' ', '\t', '\n', '\r'))
        end method space?;
  local method empty-string? (s :: <string>) => (empty-p :: <boolean>)
          every?(space?, s)
        end method empty-string?;
  
  let words :: <queue> = make(<list-queue>);
  let old :: <integer> = 0;
  let curr :: <integer> = 0;

  while (curr < size(input))
    if (space?(input[curr]))
      let word :: <string> = copy-sequence(input, start: old, end: curr);
      if (~ empty-string?(word))
        enqueue!(words, word);
      end if;
      old := curr + 1;
    end if;
    curr := curr + 1;
  end while;

  let last-word :: <string> = copy-sequence(input, start: old, end: curr);
  if (~ empty-string?(last-word))
    enqueue!(words, last-word);
  end if;
  words
end function tokenize-into-words;

define function main (args :: <vector>) => ()
  if (size(args) >= 3)
    let table :: <symbol-table> =
      make(select (args[0] by \=)
             "bst" => <binary-search-tree>;
             "list" => <list-table>;
             otherwise => <binary-search-tree>;
           end select);
    let minimal-key-size :: <integer> = string-to-integer(args[1]);
    let key-to-be-found :: <logging-string> =
      make(<logging-string>, content: args[2]);
    
    format-out("Note: using table type %=.\n\n", object-class(table));        
    
    for-each (word in tokenize-into-words(read-to-end(*standard-input*)))
        if (size(word) >= minimal-key-size)
          let next :: <logging-string> = make(<logging-string>, content: word);
          put!(table, next, if (contains?(table, next)) get(table, next) + 1
                            else 1 end);
        end if;
    end for-each;

    format-out("Building the table took %d comparisons.\n", *comparisons*);
    format-out("The table size is %d.\n", get-size(table));

    *comparisons* := 0;
    format-out(if (contains?(table, key-to-be-found))
                 "Found %s with %d comparisons.\n"
               else
                 "Could not find %s with %d comparisons.\n"
               end, content(key-to-be-found), *comparisons*);
  end if;
end function main;

main(application-arguments());
