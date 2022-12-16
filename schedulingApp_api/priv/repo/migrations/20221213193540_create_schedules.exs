defmodule SchedulingAppApi.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :content, :text
      add :date, :naive_datetime
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:schedules, [:user_id])
  end
end
