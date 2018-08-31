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
costs = ["1.00/kg", "2.00/kg", "3.00/kg", "4.00/kg", "5.00/kg"]
prices = ["5.50/kg", "6.50/kg", "7.50/kg", "8.50/kg", "9.50/kg"]


# Images
file_path = Rails.root + "../mock-data/"
soft_cheese = file_path + "soft-cheese.jpg"
semi_soft_cheese = file_path + "semi-soft-cheese.jpg"
hard_cheese = file_path + "hard-cheese.jpeg"
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

    name = Faker::MostInterestingManInTheWorld.unique.quote

    cheese = Cheese.create!(
      name: name,
      texture: texture,
      milk: milk,
      region: region,
      strength: strength,
      wine_pairing: wine,
      supplier_id: supplier.id,
      cost: cost,
      price: price)
    cheese.image.attach(io: File.open(picture), filename: "pic.jpg")
  end
end