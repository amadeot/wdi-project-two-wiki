require_relative "config"

users = [
  {username: "deo", email: "deo@ama.deo", password_digest: "$2a$10$nh1vnGMZPVDDq.0er6oQweH7l49DyJzj5sFxSNenCy/rHp2azIO8O"},
  {username: "default admin", email:"admin@ad.min", password_digest: "$2a$10$nh1vnGMZPVDDq.0er6oQweH7l49DyJzj5sFxSNenCy/rHp2azIO8O"}
]

User.create(users)

articles = [
  {header: "200 North End", body_text: "ipsum lorem", user_id: 1, created_at: DateTime.new(2015,12,02,02,07), updated_at: DateTime.new(2015,12,02,02,07)},
  {header: "450 Chambers", body_text: "lorem ipsum", user_id: 2,created_at: DateTime.new(2015,12,2,2,8), updated_at: DateTime.new(2015,12,2,2,8)},
  {header: "1 Rector", body_text: "fuck this building", user_id: 1, created_at: DateTime.new(2015,12,2,2,9), updated_at: DateTime.new(2015,12,2,2,9)}
]

Article.create(articles)

categories = [
  {name: "tips"},
  {name: "shitty people"},
  {name: "regulars"}
]

Category.create(categories)

a1 = Article.first
c1 = Category.first

a1.categories.push(c1)
