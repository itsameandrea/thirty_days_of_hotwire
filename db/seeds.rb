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
