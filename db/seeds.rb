User.delete_all
Article.delete_all
UserArticles.delete_all

u1 = User.create!(email: 'joe@example.com', password: 'password')

(1..3).each do |i|
  u1.articles.create!(title: "title_#{i}", body: "body_#{i}")
end

u2 = User.create!(email: 'fred@example.com', password: 'password')
(5..10).each do |i|
  puts "u2 is #{u2.inspect}"
  puts "i is #{i}"
  u2.articles.create!(title: "title_#{i}", body: "body_#{i}")
end

User.create!(email: 'jack@example.com', password: 'password')
User.create!(email: 'jill@example.com', password: 'password')

