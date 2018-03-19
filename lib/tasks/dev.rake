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







end
