class Gossip
  attr_accessor :auteur, :content

  def initialize(auteur, content)
    @auteur = auteur
    @content = content
  end

   def save
      CSV.open("./db/gossip.csv", "ab") { |csv| csv << [@auteur, @content]}
    end

    def self.all
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
      all_gossips
    end

    def self.find(id)
      gossips = self.all
      gossips[id.to_i]
    end
end