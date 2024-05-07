defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def home(conn, _params) do
    # print("Hello, world!")
    # The home page is often custom made,
    # so skip the default app layout.
    IO.puts "jjm Hello World2"
    # IO.inspect conn, label: " jjm The list is"
    render(conn, :home, layout: false)
  end
end
