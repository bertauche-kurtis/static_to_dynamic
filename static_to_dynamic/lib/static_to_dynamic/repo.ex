defmodule StaticToDynamic.Repo do
  use Ecto.Repo,
    otp_app: :static_to_dynamic,
    adapter: Ecto.Adapters.Postgres
end
