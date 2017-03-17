namespace :products do
  desc "Export product inventory to csv"
  task :print_csv => :environment do
    puts "Product Name, Remaining_quantity"
    Product.all.each do |product|
      puts "#{product.name}, #{product.inventory}"
    end
  end
end
