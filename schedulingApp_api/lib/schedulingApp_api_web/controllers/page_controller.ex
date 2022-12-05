defmodule SchedulingAppApiWeb.PageController do
  use SchedulingAppApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
