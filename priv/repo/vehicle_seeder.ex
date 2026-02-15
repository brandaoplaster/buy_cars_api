defmodule Seeds.VehicleSeeder do
  alias BuyCarsApi.Repo
  alias BuyCarsApi.Catalog.Vehicle
  alias BuyCarsApi.Catalog.Category
  require Logger

  @api_key System.get_env("API_NINJAS_KEY")
  @cars_url "https://api.api-ninjas.com/v1/cars"
  @motorcycles_url "https://api.api-ninjas.com/v1/motorcycles"

  @car_brands [
    "Toyota",
    "Honda",
    "Ford",
    "Chevrolet",t co
    "BMW",
    "Mercedes-Benz",
    "Audi",
    "Volkswagen",
    "Nissan",
    "Hyundai",
    "Kia",
    "Mazda",
    "Subaru",
    "Lexus",
    "Porsche",
    "Ferrari",
    "Lamborghini",
    "Tesla",
    "Jeep",
    "Ram",
    "GMC",
    "Dodge",
    "Chrysler",
    "Cadillac",
    "Volvo",
    "Jaguar",
    "Land Rover",
    "Alfa Romeo",
    "Fiat",
    "Mitsubishi",
    "Suzuki",
    "Acura",
    "Infiniti"
  ]

  @motorcycle_brands [
    "Harley-Davidson",
    "Yamaha",
    "Honda",
    "Kawasaki",
    "Suzuki",
    "Ducati",
    "BMW",
    "Triumph",
    "KTM",
    "Indian"
  ]

  @japan_brands [
    "toyota",
    "honda",
    "nissan",
    "mazda",
    "subaru",
    "lexus",
    "acura",
    "infiniti",
    "suzuki",
    "mitsubishi",
    "kawasaki",
    "yamaha"
  ]
  @usa_brands [
    "ford",
    "chevrolet",
    "tesla",
    "jeep",
    "ram",
    "gmc",
    "dodge",
    "chrysler",
    "cadillac",
    "harley-davidson",
    "indian"
  ]
  @germany_brands ["bmw", "mercedes-benz", "audi", "volkswagen", "porsche", "ktm"]
  @italy_brands ["ferrari", "lamborghini", "alfa romeo", "fiat", "ducati"]
  @korea_brands ["hyundai", "kia"]
  @sweden_brands ["volvo"]
  @uk_brands ["jaguar", "land rover", "triumph"]

  @sports_brands ["porsche", "ferrari", "lamborghini"]
  @suv_brands ["jeep", "land rover", "toyota", "nissan", "mazda", "subaru", "honda"]
  @truck_brands ["ford", "ram", "chevrolet", "gmc", "dodge"]
  @van_brands ["chrysler"]

  @cruiser_brands ["harley-davidson", "indian"]
  @sport_bike_brands ["ducati", "kawasaki", "yamaha"]
  @touring_brands ["bmw", "triumph"]

  @years 2015..2024

  def seed do
    Logger.info("Starting vehicle seeding...")

    categories = create_categories()

    # Seed cars
    Enum.each(@car_brands, fn brand ->
      Enum.each(@years, fn year ->
        seed_vehicles(brand, year, categories, :car)
        Process.sleep(100)
      end)
    end)

    # Seed motorcycles
    Enum.each(@motorcycle_brands, fn brand ->
      Enum.each(@years, fn year ->
        seed_vehicles(brand, year, categories, :motorcycle)
        Process.sleep(100)
      end)
    end)

    Logger.info("Vehicle seeding completed!")
  end

  defp create_categories do
    categories = [
      %{name: "Sedan", description: "4-door passenger car"},
      %{name: "SUV", description: "Sport Utility Vehicle"},
      %{name: "Truck", description: "Pickup truck"},
      %{name: "Sports", description: "High-performance vehicle"},
      %{name: "Van", description: "Cargo or passenger van"},
      %{name: "Cruiser", description: "Cruiser motorcycle"},
      %{name: "Sport Bike", description: "Sport motorcycle"},
      %{name: "Touring", description: "Touring motorcycle"}
    ]

    Enum.map(categories, fn cat ->
      case Repo.get_by(Category, name: cat.name) do
        nil ->
          {:ok, category} =
            %Category{}
            |> Category.changeset(cat)
            |> Repo.insert()

          category

        existing ->
          existing
      end
    end)
  end

  defp seed_vehicles(brand, year, categories, vehicle_type) do
    Logger.info("Fetching #{vehicle_type} #{brand} #{year}...")

    case fetch_vehicles(brand, year, vehicle_type) do
      {:ok, vehicles} ->
        vehicles
        |> Enum.take(3)
        |> Enum.each(fn vehicle ->
          insert_vehicle(vehicle, categories, vehicle_type)
        end)

      {:error, reason} ->
        Logger.error("Failed to fetch #{vehicle_type} #{brand} #{year}: #{reason}")
    end
  end

  defp fetch_vehicles(brand, year, :car) do
    url = "#{@cars_url}?make=#{URI.encode(brand)}&year=#{year}&limit=3"
    headers = [{"X-Api-Key", @api_key}]

    case Req.get(url, headers: headers) do
      {:ok, %{status: 200, body: body}} -> {:ok, body}
      {:ok, %{status: status}} -> {:error, "HTTP #{status}"}
      {:error, reason} -> {:error, reason}
    end
  end

  defp fetch_vehicles(brand, year, :motorcycle) do
    url = "#{@motorcycles_url}?make=#{URI.encode(brand)}&year=#{year}&limit=3"
    headers = [{"X-Api-Key", @api_key}]

    case Req.get(url, headers: headers) do
      {:ok, %{status: 200, body: body}} -> {:ok, body}
      {:ok, %{status: status}} -> {:error, "HTTP #{status}"}
      {:error, reason} -> {:error, reason}
    end
  end

  defp insert_vehicle(data, categories, vehicle_type) do
    category = determine_category(data["make"], vehicle_type, categories)

    vehicle_params = %{
      model: data["model"],
      brand: data["make"],
      year: data["year"],
      chassis_number: generate_chassis(),
      color: Enum.random(["Black", "White", "Silver", "Red", "Blue", "Gray"]),
      mileage: Enum.random(0..100_000),
      price: determine_price(vehicle_type),
      status: Enum.random(["available", "sold", "reserved"]),
      condition: Enum.random(["new", "used", "certified"]),
      country_of_origin: determine_country(data["make"]),
      category_id: category.id,
      vehicle_type: vehicle_type
    }

    case %Vehicle{}
         |> Vehicle.changeset(vehicle_params)
         |> Repo.insert() do
      {:ok, _vehicle} ->
        Logger.info("Inserted #{vehicle_type} #{data["make"]} #{data["model"]} #{data["year"]}")

      {:error, changeset} ->
        Logger.error("Failed to insert vehicle: #{inspect(changeset.errors)}")
    end
  end

  defp determine_category(brand, :car, categories) do
    category_name =
      case String.downcase(brand) do
        b when b in @sports_brands -> "Sports"
        b when b in @suv_brands -> "SUV"
        b when b in @truck_brands -> "Truck"
        b when b in @van_brands -> "Van"
        _ -> "Sedan"
      end

    Enum.find(categories, fn c -> c.name == category_name end)
  end

  defp determine_category(brand, :motorcycle, categories) do
    category_name =
      case String.downcase(brand) do
        b when b in @cruiser_brands -> "Cruiser"
        b when b in @sport_bike_brands -> "Sport Bike"
        b when b in @touring_brands -> "Touring"
        _ -> "Sport Bike"
      end

    Enum.find(categories, fn c -> c.name == category_name end)
  end

  defp determine_price(:car), do: Decimal.new(Enum.random(15_000..80_000))
  defp determine_price(:motorcycle), do: Decimal.new(Enum.random(5_000..40_000))

  defp determine_country(brand) do
    case String.downcase(brand) do
      b when b in @japan_brands -> "Japan"
      b when b in @usa_brands -> "USA"
      b when b in @germany_brands -> "Germany"
      b when b in @italy_brands -> "Italy"
      b when b in @korea_brands -> "South Korea"
      b when b in @sweden_brands -> "Sweden"
      b when b in @uk_brands -> "UK"
      _ -> "Unknown"
    end
  end

  defp generate_chassis do
    charset = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789"
    for _ <- 1..17, into: "", do: <<Enum.random(String.to_charlist(charset))>>
  end
end
