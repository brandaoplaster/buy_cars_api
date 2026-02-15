defmodule BuyCarsApi.Repo.Migrations.CreateTestDrives do
  use Ecto.Migration

  def change do
    create table(:test_drives) do
      add :scheduled_date, :naive_datetime
      add :completed_date, :naive_datetime
      add :status, :string
      add :notes, :text
      add :customer_id, references(:customers, on_delete: :nothing)
      add :vehicle_id, references(:vehicles, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:test_drives, [:customer_id])
    create index(:test_drives, [:vehicle_id])
  end
end
