defmodule BuyCarsApi.Repo.Migrations.CreateSales do
  use Ecto.Migration

  def change do
    create table(:sales) do
      add :sale_date, :naive_datetime
      add :sale_price, :decimal
      add :payment_method, :string
      add :status, :string
      add :customer_id, references(:customers, on_delete: :nothing)
      add :vehicle_id, references(:vehicles, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:sales, [:customer_id])
    create index(:sales, [:vehicle_id])
  end
end
