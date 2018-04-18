namespace :dev do
  task fake_product: :environment do
    Product.delete_all
    Order.delete_all
    1000.times do
      Product.create(
      name: FFaker::Name.first_name,
      description: FFaker::Lorem.paragraph,
      price: (rand(500)+1) * 10,
      image: FFaker::Avatar.image,
      category: Category.all.sample
      )
    end
    puts "Have created #{Product.count} products!"
  end



  task add_category: :environment do
    Product.all.each do |product|
      product.category_id.create!(
      category_id: Category.all.sample,
      )
    end
    puts "Add category to all Product"
  end




end
