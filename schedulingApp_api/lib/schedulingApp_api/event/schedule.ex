defmodule SchedulingAppApi.Event.Schedule do
  use Ecto.Schema
  import Ecto.Changeset
  alias SchedulingAppApi.Accounts.User

  schema "schedules" do
    field :content, :string
    field :date, :naive_datetime
   # field :user_id, :id
    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:content, :date, :user_id])
    |> validate_required([:content, :date, :user_id])
  end
end
