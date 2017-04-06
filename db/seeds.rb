require 'ffaker'

1000.times do
  Product.create(name: FFaker::Food.fruit,
  description: FFaker::HipsterIpsum.paragraphs.join("\r\n",),
  price: rand(10.0...20.0).round(2), inventory: rand(10...50))
 end
