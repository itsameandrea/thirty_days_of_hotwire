FavouriteTechnology.destroy_all
Technology.destroy_all
User.destroy_all

web_dev_technologies = [
  'HTML',
  'CSS',
  'JavaScript',
  'React',
  'Angular',
  'Vue.js',
  'Node.js',
  'Express.js',
  'Ruby on Rails',
  'Django',
  'Flask',
  'ASP.NET',
  'Laravel',
  'Symfony',
  'CodeIgniter',
  'CakePHP',
  'Spring',
  'Struts',
  'Hibernate',
  'JSP'
]

web_dev_technologies.each do |tech_name|
  Technology.create(name: tech_name)
end

usernames = ['lukeskywalker', 'princessleia', 'hansolo', 'chewbacca', 'obiwan']

usernames.each do |username|
  email = username + '@rebels.com'
  User.create!(
    email: email,
    username: username,
    password: "password",
    password_confirmation: "password"
  )
end