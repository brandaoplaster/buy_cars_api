defmodule BuyCarsApi.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :model, :string
      add :brand, :string
      add :year, :integer
      add :color, :string
      add :mileage, :integer
      add :price, :decimal
      add :status, :string
      add :condition, :string
      add :country_of_origin, :string
      add :vehicle_type, :string, null: false, default: "car"
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:vehicles, [:category_id])
  end
end
