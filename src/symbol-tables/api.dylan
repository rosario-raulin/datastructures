module: symbol-tables

define open abstract class <symbol-table> (<datastructure>)
end class <symbol-table>;

define generic put! (table :: <symbol-table>, key, value) => ();
define generic get (table :: <symbol-table>, key) => (value);
define generic delete! (table :: <symbol-table>, key) => ();
define generic contains?
    (table :: <symbol-table>, key) => (contains-p :: <boolean>);
define generic keys (table :: <symbol-table>) => (keys);

define class <key-not-found> (<error>)
  constant slot value, required-init-keyword: value:;
end class <key-not-found>;

define method contains?
    (table :: <symbol-table>, element-key) => (contains-p :: <boolean>)
  block (return)
    get(table, element-key);
    return(#t)
  exception (e :: <key-not-found>)
    return(#f)
  end block
end method contains?;
