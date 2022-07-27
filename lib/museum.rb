class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name 
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended_exhibits = []
    patron.interests.each do |interest|
      exhibits.each do |exhibit|
        recommended_exhibits << exhibit if interest == exhibit.name
      end
    end
    recommended_exhibits
  end

  def admit(patron)
    patrons << patron
  end

  def patrons_by_exhibit_interest
    by_exhibit = {}
    require 'pry'; binding.pry
    # x = patrons group by patron 
    # patrons map patron
    # by_exhibit[exhibit]   

  end
end

# exhibit_person_count = {}
#     patrons.each do |patron|
#       patron.interests.each do |interest|
       
#         exhibit_person_count[interest] = patron
#       end
#     end
#     exhibit_person_count