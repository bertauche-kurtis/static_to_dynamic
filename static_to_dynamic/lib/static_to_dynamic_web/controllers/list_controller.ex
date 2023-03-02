defmodule StaticToDynamicWeb.StaticToDynamicWeb.ListController do
  use StaticToDynamicWeb, :controller

  def index(conn, _params) do
    render(conn, :index, today: Date.utc_today())
  end

  def test(conn, _params) do
    render(conn, :test, name: "Tim")
  end
end
