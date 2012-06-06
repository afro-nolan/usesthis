require 'mysql2'

class Resource
        class << self
                attr_accessor :database
        end
                
        def self.fetch(q)
                items = []
                
                Resource.database.query(q).each do |row|
                        item = self.new
                        
                        row.each do |key, value|
                                item.send("#{key}=", value) if item.respond_to?("#{key}=")
                        end
                        
                        items << item
                end  
                
                items
        end
end