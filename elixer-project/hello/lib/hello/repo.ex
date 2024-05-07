defmodule Hello.Repo do
  use Ecto.Repo,
    otp_app: :jjm,
    adapter: Ecto.Adapters.Postgres
end
