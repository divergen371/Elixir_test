defmodule BasicWeb.MemberController do
  use BasicWeb, :controller

  def index(conn, _p) do
    conn
    |> json(
      "select * from members"
      |> Db.query()
      |> Db.columns_rows()
      |> Enum.sort(fn current, next -> current["id"] < next["id"] end)
    )
  end

  def create(conn, p) do
    "insert into members values('#{p["name"]}', #{p["age"]}, '#{p["team"]}', '#{p["position"]}')"
    |> Db.query()

    send_resp(conn, :created, "")
  end

  def update(conn, p) do
    "update members set name = '#{p["name"]}', age = #{p["age"]}, team = '#{p["team"]}', position = '#{p["position"]}' where id = #{p["id"]}"
    |> Db.query()

    send_resp(conn, :ok, "")
  end

  def delete(conn, p) do
    "delete from members where id = #{p["id"]}"
    |> Db.query()

    send_resp(conn, :no_content, "")
  end
end
