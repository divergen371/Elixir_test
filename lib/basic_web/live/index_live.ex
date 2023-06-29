defmodule BasicWeb.IndexLive do
  use Phoenix.LiveView
  use BasicWeb, :live_view

  @url "http://localhost:4000/members"
  @headers ["Content-Type", "application/json"]

  def get() do
    Req.get!(@url, headers: @headers).body
    |> Enum.map(&(&1 |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)))
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, members: get())}
  end
end
