defmodule BuyCarsApi.Repo.Migrations.CreateDealers do
  use Ecto.Migration

  def change do
    create table(:dealers) do
      add :name, :string
      add :document, :string
      add :email, :string
      add :phone, :string
      add :address, :text

      timestamps(type: :utc_datetime)
    end
  end
end
