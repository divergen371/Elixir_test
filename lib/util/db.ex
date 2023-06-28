defmodule Util.Db do
  def query(sql) when sql != "" do
    cond do
      String.match?(sql, ~r/select.*/) -> select(sql)
      String.match?(sql, ~r/insert.*/) -> [:error, "insert unsupported"]
      String.match?(sql, ~r/update.*/) -> [:error, "update unsupported"]
      String.match?(sql, ~r/delete.*/) -> [:error, "delete unsupported"]
    end
  end

  def select(sql) do
    Regex.named_captures(
      ~r/select( *)(?<columns>.*)( *)from( *)(?<tables>.*)/,
      sql
    )["tables"]
    |> Util.DbMnesia.select
  end

  def columns_rows(result) do
    result
    |> rows
    |> Enum.map(fn row -> Enum.into(List.zip([columns(result), row]), %{}) end)
  end

  def rows(%{rows: rows} = _result), do: rows
  def columns(%{columns: columns} = _result), do: columns
end
