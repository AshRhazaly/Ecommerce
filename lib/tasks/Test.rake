namespace :products do
  desc "Export product inventory to csv"
  task :print_csv => :environment do
    puts "Product Name, Remaining_quantity"
    Product.all.each do |product|
      puts "#{product.name}, #{product.inventory}"
    end
  end
end

namespace :db do
  desc "db:drop, db:migrate, db:seed, log:clear tasks streamlined"
  task :reset => ["db:drop","db:migrate", "db:seed", "log:clear"]
end