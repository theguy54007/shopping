namespace :dev do
  task fake_product: :environment do
    Product.delete_all

    1000.times do
      Product.create(
      name: FFaker::Name.first_name,
      description: FFaker::Lorem.paragraph,
      price: (rand(500)+1) * 10,
      image: FFaker::Avatar.image
      )
    end
    puts "Have created #{Product.count} products!"
  end

  task fake_product_image: :environment do

    url = "https://uinames.com/api/?ext&region=england"

    100.times do
      response = RestClient.get(url)
      data = JSON.parse(response.body)

      product = Product.create!(
        name: data["name"],
        description: FFaker::Lorem.paragraph,
        price: (rand(500)+1) * 10,
        image: data["photo"]
      )
      puts "created user #{product.name}"
    end

      puts "now you have #{Product.count} products data"
  end

  



end
