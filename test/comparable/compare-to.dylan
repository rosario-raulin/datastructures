module: comparable-test

define function test-compare-to () => ()
  let s1 :: <string> = "foobar";
  let s2 :: <string> = "foob";
  let s3 :: <string> = "foobar42";
  let s4 :: <string> = "foobcr";

  let c1 :: <integer> = compare-to(s1, s2);
  let c2 :: <integer> = compare-to(s1, s3);
  let c3 :: <integer> = compare-to(s1, s1);
  let c4 :: <integer> = compare-to(s1, s4);

  case
    c1 ~= 2 => error("foobar - foob is %d", c1);
    c2 ~= -2 => error("foobar - foobar42 is %d", c2);
    c3 ~= 0 => error("foobar - foobar is %d", c3);
    c4 ~= -2 => error("foobar - foobcr is %d", c4);
  end case;
end function test-compare-to;
