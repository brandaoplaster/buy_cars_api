defmodule BuyCarsApi.Repo do
  use Ecto.Repo,
    otp_app: :buy_cars_api,
    adapter: Ecto.Adapters.Postgres
end
