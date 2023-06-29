defmodule BasicWeb.QiitaLive do
  use BasicWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, [query: "", datas: [], message: "[Init]"])}
  end

  def handle_event("onChange", %{"query" => query}, socket) do
    {:noreply, assign(socket, [query: query, message: ""])}
  end

  def handle_event("onSearch", %{"query" => query}, socket) do
    datas = Req.get!("https://qiita.com/api/v2/items?query=#{query}").body
    {:noreply, assign(socket, [query: query, datas: datas, message: "[Complete!!]"])}
  end
end
