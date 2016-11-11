# This file is to eager load any files, such as the classes in lib
Dir["#{Rails.root}/lib/*.rb"].each {|file| load file}