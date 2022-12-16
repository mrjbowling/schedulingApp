defmodule SchedulingAppApi.EventTest do
  use SchedulingAppApi.DataCase

  alias SchedulingAppApi.Event

  describe "schedules" do
    alias SchedulingAppApi.Event.Schedule

    import SchedulingAppApi.EventFixtures

    @invalid_attrs %{content: nil, date: nil}

    test "list_schedules/0 returns all schedules" do
      schedule = schedule_fixture()
      assert Event.list_schedules() == [schedule]
    end

    test "get_schedule!/1 returns the schedule with given id" do
      schedule = schedule_fixture()
      assert Event.get_schedule!(schedule.id) == schedule
    end

    test "create_schedule/1 with valid data creates a schedule" do
      valid_attrs = %{content: "some content", date: ~N[2022-12-12 19:35:00]}

      assert {:ok, %Schedule{} = schedule} = Event.create_schedule(valid_attrs)
      assert schedule.content == "some content"
      assert schedule.date == ~N[2022-12-12 19:35:00]
    end

    test "create_schedule/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Event.create_schedule(@invalid_attrs)
    end

    test "update_schedule/2 with valid data updates the schedule" do
      schedule = schedule_fixture()
      update_attrs = %{content: "some updated content", date: ~N[2022-12-13 19:35:00]}

      assert {:ok, %Schedule{} = schedule} = Event.update_schedule(schedule, update_attrs)
      assert schedule.content == "some updated content"
      assert schedule.date == ~N[2022-12-13 19:35:00]
    end

    test "update_schedule/2 with invalid data returns error changeset" do
      schedule = schedule_fixture()
      assert {:error, %Ecto.Changeset{}} = Event.update_schedule(schedule, @invalid_attrs)
      assert schedule == Event.get_schedule!(schedule.id)
    end

    test "delete_schedule/1 deletes the schedule" do
      schedule = schedule_fixture()
      assert {:ok, %Schedule{}} = Event.delete_schedule(schedule)
      assert_raise Ecto.NoResultsError, fn -> Event.get_schedule!(schedule.id) end
    end

    test "change_schedule/1 returns a schedule changeset" do
      schedule = schedule_fixture()
      assert %Ecto.Changeset{} = Event.change_schedule(schedule)
    end
  end
end
