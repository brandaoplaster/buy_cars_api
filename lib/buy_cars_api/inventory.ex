defmodule BuyCarsApi.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias BuyCarsApi.Repo

  alias BuyCarsApi.Inventory.VehicleDealer

  @doc """
  Returns the list of vehicles_dealers.

  ## Examples

      iex> list_vehicles_dealers()
      [%VehicleDealer{}, ...]

  """
  def list_vehicles_dealers do
    Repo.all(VehicleDealer)
  end

  @doc """
  Gets a single vehicle_dealer.

  Raises `Ecto.NoResultsError` if the Vehicle dealer does not exist.

  ## Examples

      iex> get_vehicle_dealer!(123)
      %VehicleDealer{}

      iex> get_vehicle_dealer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vehicle_dealer!(id), do: Repo.get!(VehicleDealer, id)

  @doc """
  Creates a vehicle_dealer.

  ## Examples

      iex> create_vehicle_dealer(%{field: value})
      {:ok, %VehicleDealer{}}

      iex> create_vehicle_dealer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vehicle_dealer(attrs) do
    %VehicleDealer{}
    |> VehicleDealer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vehicle_dealer.

  ## Examples

      iex> update_vehicle_dealer(vehicle_dealer, %{field: new_value})
      {:ok, %VehicleDealer{}}

      iex> update_vehicle_dealer(vehicle_dealer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vehicle_dealer(%VehicleDealer{} = vehicle_dealer, attrs) do
    vehicle_dealer
    |> VehicleDealer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vehicle_dealer.

  ## Examples

      iex> delete_vehicle_dealer(vehicle_dealer)
      {:ok, %VehicleDealer{}}

      iex> delete_vehicle_dealer(vehicle_dealer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vehicle_dealer(%VehicleDealer{} = vehicle_dealer) do
    Repo.delete(vehicle_dealer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vehicle_dealer changes.

  ## Examples

      iex> change_vehicle_dealer(vehicle_dealer)
      %Ecto.Changeset{data: %VehicleDealer{}}

  """
  def change_vehicle_dealer(%VehicleDealer{} = vehicle_dealer, attrs \\ %{}) do
    VehicleDealer.changeset(vehicle_dealer, attrs)
  end
end
