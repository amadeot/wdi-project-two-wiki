require_relative "config"

users = [
  {username: "deo", email: "deo@ama.deo"},
  {username: "default admin", email:"admin@ad.min"}
]

User.create(users)

articles = [
  {header: "200 North End", body_text: "ipsum lorem", user_id: 1, updated_at: DateTime.new(2015,12,02,02,07)},
  {header: "450 Chambers", body_text: "lorem ipsum", user_id: 2,updated_at: DateTime.new(2015,12,2,2,8)},
  {header: "1 Rector", body_text: "fuck this building", user_id: 1, updated_at: DateTime.new(2015,12,2,2,9)}
]

Article.create(articles)

categories = [
  {name: "tips"},
  {name: "shitty people"},
  {name: "regulars"}
]

Category.create(categories)