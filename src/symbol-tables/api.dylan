module: symbol-tables

define open abstract class <symbol-table> (<datastructure>)
end class <symbol-table>;

define generic put! (table, key, value) => ();
define generic get (table, key) => (value);
define generic delete! (table, key) => ();
define generic contains? (table, key) => (contains-p);
define generic keys (table) => (keys);
