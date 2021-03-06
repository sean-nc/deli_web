# Single User
User.create!(
  email: "sean.n.cordes@gmail.com",
  password: "password",
  password_confirmation: "password")

# Property Models
Milk.create(name: "Cows")
Milk.create(name: "Sheep")
Milk.create(name: "Goat")

Texture.create(name: "Soft")
Texture.create(name: "Semi-Soft")
Texture.create(name: "Hard")

Region.create(name: "Spain")
Region.create(name: "Italy")
Region.create(name: "Greece")

Wine.create(name: "Red")
Wine.create(name: "White")
Wine.create(name: "Merlot")

Strength.create(name: "Strong")
Strength.create(name: "Mild")
Strength.create(name: "Medium")

# Properties Arrays
wines = Wine.all.map { |x| x.name }
regions = Region.all.map { |x| x.name }
milks = Milk.all.map { |x| x.name }
textures = Texture.all.map { |x| x.name }
strengths = Strength.all.map { |x| x.name }
costs = [100, 200, 300, 400, 500]
prices = [550, 650, 750, 850, 950]


# Images
file_path = Rails.root + "../mock-data/"
soft_cheese = file_path + "soft-cheese.jpg"
semi_soft_cheese = file_path + "semi-soft-cheese.jpg"
hard_cheese = file_path + "hard-cheese.jpg"
pic_array = [soft_cheese, semi_soft_cheese, hard_cheese]

# Create Supplier and Cheeses
5.times do |n|
  company = Faker::Company.unique.name
  name = Faker::Name.unique.name
  number = Faker::PhoneNumber.unique.cell_phone
  email = Faker::Internet.unique.email

  supplier = Supplier.create!(company_name: company,
                       name: name,
                       phone_number: number,
                       email: email)

  10.times do |x|

    # Set Cheese
    num = rand(0..2)
    texture = textures[num]
    picture = pic_array[num]

    num = rand(0..2)
    region = regions[num]

    num = rand(0..2)
    strength = strengths[num]

    num = rand(0..2)
    milk = milks[num]

    num = rand(0..2)
    wine = wines[num]

    num = rand(0..4)
    cost = costs[num]

    num = rand(0..4)
    price = prices[num]

    stock_goal = rand(8..20)
    in_stock = rand(0..12) 

    expires_on = Faker::Date.between(2.days.ago, 30.days.from_now) 

    name = Faker::MostInterestingManInTheWorld.unique.quote

    # Create Cheese
    cheese = Cheese.create!(
      name: name,
      texture: texture,
      milk: milk,
      region: region,
      strength: strength,
      wine_pairing: wine,
      supplier_id: supplier.id,
      cost: cost,
      price: price,
      in_stock: in_stock,
      stock_goal: stock_goal,
      expires_on: expires_on)
    cheese.image.attach(io: File.open(picture), filename: "pic.jpg")

    # Create Order
    5.times do |z|
      current = rand(1..20)
      units_per_case = rand(1..10)
      cases_ordered = rand(1..5)
      price = cost * cases_ordered
      created_at = Faker::Date.between(30.days.ago, DateTime.now)
      CheeseOrder.create(cheese_id: cheese.id,
                         supplier_id: supplier.id,
                         current_units: current,
                         cases_ordered: cases_ordered,
                         case_price: price,
                         units_per_case: units_per_case,
                         created_at: created_at)
    end
  end
end