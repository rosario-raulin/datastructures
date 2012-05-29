module: comparable

define open generic compare-to (o1, o2) => (result :: <integer>);

define inline method compare-to
    (o1 :: <integer>, o2 :: <integer>) => (result :: <integer>)
  o1 - o2
end method compare-to;

define inline method compare-to
    (o1 :: <character>, o2 :: <character>) => (result :: <integer>)
  compare-to(as(<integer>, o1), as(<integer>, o2))
end method compare-to;

define method compare-to
    (o1 :: <string>, o2 :: <string>) => (result :: <integer>)
  if ((size(o1) - size(o2)) ~= 0)
    size(o1) - size(o2)
  else
    block (return)
      for (i :: <integer> from 0 below size(o1))
        if (o1[i] ~= o2[i])
          return(compare-to(o1[i], o2[i]))
        end if;
      finally
        return(0)
      end for;
    end block;
  end if;
end method compare-to;
