defmodule SchedulingAppApi.EventFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SchedulingAppApi.Event` context.
  """

  @doc """
  Generate a schedule.
  """
  def schedule_fixture(attrs \\ %{}) do
    {:ok, schedule} =
      attrs
      |> Enum.into(%{
        content: "some content",
        date: ~N[2022-12-12 19:35:00]
      })
      |> SchedulingAppApi.Event.create_schedule()

    schedule
  end
end
