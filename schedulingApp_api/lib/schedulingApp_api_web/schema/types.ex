defmodule SchedulingAppApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias SchedulingAppApiWeb.Schema.Types

  import_types(Types.Usertype)
  import_types(Types.SessionType)
end
