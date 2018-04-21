namespace :dev do
  task fake_product: :environment do
    Product.delete_all
    
    100.times do
      Product.create(
      name: FFaker::Name.first_name,
      description: FFaker::Lorem.paragraph,
      price: (rand(500)+1) * 10,
      image: File.open("#{Rails.root}/public/seed_img/#{rand(0..9)}.jpg"),
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

task fake_user: :environment do
    User.where(role: nil).delete_all
    20.times do |i|
      
      user_name = FFaker::Name.first_name
      User.create!(
      email: "#{user_name}@example.com",
      password: "12345678",
      
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} data"
  end


  task fake_comment: :environment do
    Comment.delete_all
    Product.all.each do |product|
      3.times do |i|
        product.comments.create!(
        content: FFaker::Lorem.sentence,
        user: User.all.sample)
      end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comments"

  end



end
