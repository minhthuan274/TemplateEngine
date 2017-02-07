require 'sinatra'
require 'erb'

images = [
  "1.jpg",
  "2.jpg",
  "3.jpg"
]

get "/" do
  @images = images
  erb :index
end

get "/index.html" do 
  @images = images
  erb :index
end

get '/works.html' do 
  @Navs = Nav.GetNavs
  haml :works
end

class Nav
  attr_reader :link, :name
  @@Navs = []
  def initialize(link, name)
    @link = link
    @name = name
    @@Navs << self
  end

  def Nav.GetNavs 
    @@Navs
  end
end

Nav.new("about.html", 'about us')
Nav.new("services.html", "services")
Nav.new("works.html", "works")
Nav.new("blog.html", "blog")
Nav.new("contact.html", "contact")