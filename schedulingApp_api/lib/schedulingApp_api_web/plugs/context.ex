defmodule SchedulingAppApiWeb.Plugs.Context do
  alias ElixirSense.Plugin
  @behaviour Plugin

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
    {:ok, claims} <- SchedulingAppApi.Guardian.decode_and_verify(token),
    {:ok, user} <- SchedulingAppApi.Guardian.resource_from_claims(claims) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end
end
