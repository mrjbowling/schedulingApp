defmodule SchedulingAppApiWeb.Schema.Types.ScheduleType do
  use Absinthe.Schema.Notation

  source = Dataloader.Ecto.new(SchedulingAppApi.Repo)
  
  object :schedule_type do
    field(:id, :id)
    field(:date, :date_time)
    field(:content, :string)
    field(:user, :user_type, resolve: assoc(:user))
  end

  input_object :schedule_input_type do
    field(:content, non_null(:string))
    field(:date, non_null(:date_time))
  end

end
