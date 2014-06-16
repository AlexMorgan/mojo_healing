require 'csv'
require 'sinatra'
require 'shotgun'
require 'csv'
require 'pry'

def read_from_csv(filename)
  testimonials = []
  CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
    testimonials << row.to_hash
  end
  testimonials
end

def write_to_csv(filename, name, testimonial)
  CSV.open(filename, 'a') do |row|
    row << [name,testimonial]
  end
end

#------------------------------------------ Routes ------------------------------------------
get '/' do
  @testimonials = read_from_csv('testimonials.csv')
  erb  :index
end

get '/testimonial' do
  @testimonials = read_from_csv('testimonials.csv')
  erb :'/testimonials/index'
end

post '/testimonial' do
  name = params['name']
  testimonial = params['testimonial']

  write_to_csv('testimonials.csv', name, testimonial)

  redirect '/'
end

# http://ididitmyway.herokuapp.com/past/2010/12/4/an_email_contact_form_in_sinatra/ ---- Sinatra Contact Form
