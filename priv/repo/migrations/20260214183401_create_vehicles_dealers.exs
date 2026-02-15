defmodule BuyCarsApi.Repo.Migrations.CreateVehiclesDealers do
  use Ecto.Migration

  def change do
    create table(:vehicles_dealers) do
      add :acquisition_date, :date
      add :acquisition_price, :decimal
      add :vehicle_id, references(:vehicles, on_delete: :nothing)
      add :dealer_id, references(:dealers, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:vehicles_dealers, [:vehicle_id])
    create index(:vehicles_dealers, [:dealer_id])
  end
end
