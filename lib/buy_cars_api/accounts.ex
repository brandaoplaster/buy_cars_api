defmodule BuyCarsApi.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias BuyCarsApi.Repo

  alias BuyCarsApi.Accounts.Customer

  @doc """
  Returns the list of customers.

  ## Examples

      iex> list_customers()
      [%Customer{}, ...]

  """
  def list_customers do
    Repo.all(Customer)
  end

  @doc """
  Gets a single customer.

  Raises `Ecto.NoResultsError` if the Customer does not exist.

  ## Examples

      iex> get_customer!(123)
      %Customer{}

      iex> get_customer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_customer!(id), do: Repo.get!(Customer, id)

  @doc """
  Creates a customer.

  ## Examples

      iex> create_customer(%{field: value})
      {:ok, %Customer{}}

      iex> create_customer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_customer(attrs) do
    %Customer{}
    |> Customer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a customer.

  ## Examples

      iex> update_customer(customer, %{field: new_value})
      {:ok, %Customer{}}

      iex> update_customer(customer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_customer(%Customer{} = customer, attrs) do
    customer
    |> Customer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a customer.

  ## Examples

      iex> delete_customer(customer)
      {:ok, %Customer{}}

      iex> delete_customer(customer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_customer(%Customer{} = customer) do
    Repo.delete(customer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking customer changes.

  ## Examples

      iex> change_customer(customer)
      %Ecto.Changeset{data: %Customer{}}

  """
  def change_customer(%Customer{} = customer, attrs \\ %{}) do
    Customer.changeset(customer, attrs)
  end

  alias BuyCarsApi.Accounts.Dealer

  @doc """
  Returns the list of dealers.

  ## Examples

      iex> list_dealers()
      [%Dealer{}, ...]

  """
  def list_dealers do
    Repo.all(Dealer)
  end

  @doc """
  Gets a single dealer.

  Raises `Ecto.NoResultsError` if the Dealer does not exist.

  ## Examples

      iex> get_dealer!(123)
      %Dealer{}

      iex> get_dealer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dealer!(id), do: Repo.get!(Dealer, id)

  @doc """
  Creates a dealer.

  ## Examples

      iex> create_dealer(%{field: value})
      {:ok, %Dealer{}}

      iex> create_dealer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dealer(attrs) do
    %Dealer{}
    |> Dealer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dealer.

  ## Examples

      iex> update_dealer(dealer, %{field: new_value})
      {:ok, %Dealer{}}

      iex> update_dealer(dealer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dealer(%Dealer{} = dealer, attrs) do
    dealer
    |> Dealer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dealer.

  ## Examples

      iex> delete_dealer(dealer)
      {:ok, %Dealer{}}

      iex> delete_dealer(dealer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dealer(%Dealer{} = dealer) do
    Repo.delete(dealer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dealer changes.

  ## Examples

      iex> change_dealer(dealer)
      %Ecto.Changeset{data: %Dealer{}}

  """
  def change_dealer(%Dealer{} = dealer, attrs \\ %{}) do
    Dealer.changeset(dealer, attrs)
  end
end
