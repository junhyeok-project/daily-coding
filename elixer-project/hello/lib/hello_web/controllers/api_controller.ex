defmodule HelloWeb.APIController do
  use HelloWeb, :controller

  def home(conn, _params) do
    IO.puts "jjm Hello API"
    render(conn, :home, layout: true)
  end
end
