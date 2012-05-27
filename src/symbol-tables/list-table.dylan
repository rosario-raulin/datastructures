module: symbol-tables

define class <table-node> (<object>)
  constant slot key, required-init-keyword: key:;
  slot value, required-init-keyword: value:;
  constant slot next :: false-or(<table-node>), init-keyword: next:,
    init-value: #f;
end class <table-node>;

define class <list-table> (<symbol-table>)
  slot size :: <integer>, init-value: 0;
  slot top :: false-or(<table-node>), init-value: #f;
end class <list-table>;

define method is-empty? (table :: <list-table>) => (empty-p :: <boolean>)
  size = 0
end method is-empty?;

define method get-size (table :: <list-table>) => (size :: <integer>)
  size(table)
end method get-size;

define method put! (table :: <list-table>, new-key, new-value) => ()
  let curr :: false-or(<table-node>) = top(table);

  block (return)
    while (curr)
      if (key(curr) = new-key)
        curr.value := new-value;
        return(#f);
      else
        curr := curr.next;
      end if;
    end while;
    table.top :=
      make(<table-node>, key: new-key, value: new-value, next: table.top);
    table.size := size(table) + 1;
  end block;
end method put!;

define method get (table :: <list-table>, element-key) => (value)
  let curr :: false-or(<table-node>) = top(table);

  block (return)
    while (curr)
      if (key(curr) = element-key)
        return(value(curr));
      end if;
      curr := next(curr);
    end while;
    
    signal(make(<key-not-found>, value: element-key));
  end block
end method get;

define method keys (table :: <list-table>) => (keys)
  let keys :: <stack> = make(<stack>);
  let curr :: false-or(<table-node>) = top(table);
  
  while (curr)
    push!(keys, curr.key);
    curr := curr.next;
  end while;
  keys
end method keys;
