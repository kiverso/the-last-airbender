class NationMembers
  attr_reader :name, :image, :affiliation, :allies, :enemies
  def self.from_api(nation)
    service = TlaService.new
    members = service.members_of_nation(nation.gsub(/_/, ' '))
    members.map { |member| NationMembers.new(member)}
  end


  def initialize(member_info)
    @name = member_info[:name]
    @image = member_info[:photoUrl]
    @affiliation = member_info[:affiliation]
    @allies = member_info[:allies]
    @enemies = member_info[:enemies]
  end
end