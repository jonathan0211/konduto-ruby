require 'factory_girl'

def load_resource(resource)
  JSON.parse(File.read("test/resources/#{resource}"))
end

FactoryGirl.find_definitions
