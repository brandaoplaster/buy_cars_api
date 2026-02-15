defmodule BuyCarsApi.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :amount, :decimal
      add :payment_date, :naive_datetime
      add :payment_method, :string
      add :installment_number, :integer
      add :status, :string
      add :sale_id, references(:sales, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:payments, [:sale_id])
  end
end
