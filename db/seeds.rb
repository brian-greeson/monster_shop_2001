# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ItemOrder.destroy_all
Order.destroy_all
User.destroy_all
Merchant.destroy_all

#merchants
bike_shop = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
dog_shop = Merchant.create(name: "Brian's Dog Shop", address: '125 Doggo St.', city: 'Denver', state: 'CO', zip: 80210)

#bike_shop items
tire1 = bike_shop.items.create(name: "Gatorskins1", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
tire2 = bike_shop.items.create(name: "Gatorskins2", description: "They'll never pop!", price: 100, image: "https://tinyurl.com/tn7jnts", inventory: 12)
tire3 = bike_shop.items.create(name: "Gatorskins3", description: "They'll never pop!", price: 100, image: "https://tinyurl.com/tn7jnts", inventory: 12)

#dog_shop items
pull_toy1 = dog_shop.items.create(name: "Pull Toy1", description: "Great pull toy!", price: 10, image: "https://tinyurl.com/rzhm3qd", inventory: 32)
pull_toy2  = dog_shop.items.create(name: "Pull Toy2", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32)
pull_toy3 = dog_shop.items.create(name: "Pull Toy3", description: "Great pull toy!", price: 10, image: "https://tinyurl.com/rzhm3qd", inventory: 32)
dog_bone1  = dog_shop.items.create(name: "Dog Bone1", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active?:false, inventory: 21)
dog_bone2  = dog_shop.items.create(name: "Dog Bone2", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active?:false, inventory: 21)
dog_bone3  = dog_shop.items.create(name: "Dog Bone3", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active?:false, inventory: 21)

admin = User.create( email_address: 'admin@example.com', password: 'password', role: 'admin', name: 'User 1', street_address: '123 Example St', city: 'Userville', state: 'State 1', zip_code: '12345')
merchant = User.create( email_address: 'merchant@example.com', password: 'password', role: 'merchant', name: 'User 1', street_address: '123 Example St', city: 'Userville', state: 'State 1', zip_code: '12345')
user = User.create( email_address: 'user@example.com', password: 'password', role: 'default', name: 'User 1', street_address: '123 Example St', city: 'Userville', state: 'State 1', zip_code: '12345')
bike_shop.users << merchant
