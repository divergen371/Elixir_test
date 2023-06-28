defmodule Basic do
  @moduledoc """
  Basic keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def inserts() do
    :mnesia.start()
    :mnesia.dirty_write({:members, 1, "hoge", 27, "A", "Sergeant"})
    :mnesia.dirty_write({:members, 2, "hoge", 22, "A", "Corporal"})
    :mnesia.dirty_write({:members, 3, "hoge", 33, "B", "Ensign"})
    :mnesia.dirty_write({:members, 4, "hoge", 27, "C", "Sergeant"})
  end
end
