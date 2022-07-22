require 'nokogiri'
require 'open-uri'
urls = ['https://pakistanistores.com/products/xiomi', 'https://pakistanistores.com/products/Samsung-Phone','https://pakistanistores.com/products/Iphone']
for url in urls
    doc = Nokogiri::HTML4(URI.open(url))


    products = []
    doc.css('ul li div.product').each do |link|
        product = {}
        link.css('img').each do |p|
            product = {
                image_path:  p.attributes.to_hash["data-src"].value,
                product_name: p.attributes.to_hash["alt"].value
            }
        end
        link.css('div.price').each do |price|
            product['price'] = price.children[0].to_s
        end
    products.append(product)
    end
    for product in products
        company = Company.find_by(name: product[:product_name].split(" ")[0])
        if company == nil
            company = Company.create(name: product[:product_name].split(" ")[0])
        end
    p = Product.create(name: product[:product_name],
        title: product[:product_name],
        discription: Faker::Lorem.sentence(word_count: 3,
        supplemental: false,
        random_words_to_add: 4),
        price: product['price'],
        company_id: company.id,
        image_path: product[:image_path])
    end
end

if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create!(name: "Web Client", redirect_uri: " ", scopes: "public" )
    Doorkeeper::Application.create!(name: "iOS Client", redirect_uri: " ", scopes: "public" )
    Doorkeeper::Application.create!(name: "Andriod Client", redirect_uri: " ", scopes: "public" )
    Doorkeeper::Application.create!(name: "React", redirect_uri: " ", scopes: "public" ) 
end





User.first_or_create(email: 'ali@example.com', 
                     password: 'password',
                     password_confirmation: 'password',
                     role: User.roles[:admin])