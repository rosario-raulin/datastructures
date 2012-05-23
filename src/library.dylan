module: dylan-user

define library datastructures
  use dylan;
  
  export
    fundamentals;
end library datastructures;

define module datastructures
  use dylan;

  export
    <datastructure>;
end module datastructures;

define module fundamentals
  use dylan;
  use datastructures;
  
  export
    <fundamental-collection>,
    <stack>,
    push!,
    pop!,
    get-size,
    is-empty?;
end module fundamentals;
