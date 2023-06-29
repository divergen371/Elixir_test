defmodule BasicWeb.MemberController do
  use BasicWeb, :controller

  def index(conn, _p) do
    conn
    |>json(
      "select *from members"
      |> Db.query()
      |> Db.columns_rows()
      |> Enum.sort(fn current, next -> current["id"]< next["id"]end)
    )
  end
end
