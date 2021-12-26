defmodule HolidaysApiWeb.PageController do
  use HolidaysApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
