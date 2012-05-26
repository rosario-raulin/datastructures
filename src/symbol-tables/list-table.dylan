module: symbol-tables

define class <table-node> (<node>)
  slot key, required-init-keyword: key:;
end class <table-node>;

define class <list-table> (<symbol-table>)
  slot size :: <integer>, init-value: 0;
  slot head :: false-or(<table-node>), init-value: #f;
end class <list-table>;

define method is-empty? (table :: <list-table>) => (empty-p :: <boolean>)
  size = 0
end method is-empty?;

define method get-size (table :: <list-table>) => (size :: <integer>)
  size(table)
end method get-size;

define method put! (table :: <list-table>, key, value) => ()
  let curr :: false-or(<table-node>) = head(table);
  block (return)
    while (curr)
      if (curr.key = key)
        curr.value := value;
        return();
      else
        curr := curr.next;
      end if;
    end while;
    table.head := make(<table-node>, key: key, value: value, next: table.head);
  end block;
end method put!;

define method get (table :: <list-table>, key) => (value)
  let curr :: false-or(<table-node>) = head(table);

  block (return)
    while (curr)
      if (curr.key = key)
        return(#t);
      end if;
      curr := curr.next;
    end while;
    
    error("Key not found");
  end block;
end method get;

define method delete! (table :: <list-table>, key) => ()
  
end method delete!;

define method contains? (table :: <list-table>, key) => (contain-p :: <boolean>)
  let curr :: false-or(<table-node>) = head(table);

  block (return)
    while (curr)
      if (curr.key = key)
        return(#t);
      end if;
    end while;
    return(#f);
  end block
end method contains?;

define method keys (table :: <list-table>) => (keys)
  let keys :: <stack> = make(<stack>);
  let curr :: false-or(<table-node>) = head(table>);
  
  while (curr)
    keys.push(curr.key);
    curr := curr.next;
  end while;
  keys
end method keys;
