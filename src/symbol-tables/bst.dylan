module: symbol-tables

define class <binary-node> (<datastructure>)
  constant slot key, required-init-keyword: key:;
  slot value, required-init-keyword: value:;
  slot left :: false-or(<binary-node>), init-value: #f, init-keyword: left:;
  slot right :: false-or(<binary-node>), init-value: #f, init-keyword: right:;
  slot size :: <integer>, required-init-keyword: size:;
end class <binary-node>;

define class <binary-search-tree> (<symbol-table>)
  slot root :: false-or(<binary-node>), init-value: #f;
end class <binary-search-tree>;

define method get-size (node :: false-or(<binary-node>)) => (size :: <integer>)
  if (~ node) 0 else size(node) end
end method get-size;

define method get-size (tree :: <binary-search-tree>) => (size :: <integer>)
  get-size(root(tree))
end method get-size;

define method is-empty?
    (tree :: <binary-search-tree>) => (empty-p :: <boolean>)
  root(tree) = #f
end method is-empty?;

define method put! (tree :: <binary-search-tree>, entry-key, entry-value) => ()
  local method put!-intern (node :: false-or(<binary-node>))
         => (node :: <binary-node>)
          if (~ node)
            make(<binary-node>, key: entry-key, value: entry-value, size: 1)
          else
            let cmp :: <integer> = compare-to(key(node), entry-key);
            case
              (cmp > 0) => node.left := put!-intern(left(node));
              (cmp < 0) => node.right := put!-intern(right(node));
              otherwise => node.value := entry-value;
            end case;
            node.size := get-size(node.left) + get-size(node.right) + 1;
            node
          end if;
        end method put!-intern;

  tree.root := put!-intern(root(tree));
end method put!;

define method get (table :: <binary-search-tree>, entry-key) => (entry-value)
  local method get-intern (node :: false-or(<binary-node>)) => (val)
          if (~ node)
            signal(make(<key-not-found>, value: entry-key));
          else
            let cmp :: <integer> = compare-to(key(node), entry-key);
            case
              (cmp > 0) => get-intern(left(node));
              (cmp < 0) => get-intern(right(node));
              otherwise => value(node);
            end case;
          end if;
        end method get-intern;

  get-intern(root(table))
end method get;

define method keys (table :: <binary-search-tree>) => (keys :: <iterable>)
  local method keys-intern
            (node :: false-or(<binary-node>), key-collection :: <queue>)
         => (keys :: <queue>)
          if (~ node)
            key-collection
          else
            keys-intern(left(node), key-collection);
            enqueue!(key-collection, key(node));
            keys-intern(right(node), key-collection);
          end if;
        end method keys-intern;

  keys-intern(root(table), make(<list-queue>))
end method keys;
