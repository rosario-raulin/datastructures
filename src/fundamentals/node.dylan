module: fundamentals

define class <node> (<object>)
  constant slot value, required-init-keyword: value:;
  slot next :: false-or(<node>), init-keyword: next:, init-value: #f;
end class <node>;
