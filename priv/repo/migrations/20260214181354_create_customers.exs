defmodule BuyCarsApi.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string
      add :email, :string
      add :document, :string
      add :phone, :string
      add :birth_date, :date
      add :registration_date, :naive_datetime
      add :address, :text
      add :gender, :string

      timestamps(type: :utc_datetime)
    end
  end
end
