class TlaService
  def members_of_nation(nation)
    response = conn.get("characters?affiliation=#{nation} &perPage=500")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://last-airbender-api.herokuapp.com/api/v1/') do |conn|
      conn.adapter Faraday.default_adapter
    end
  end
end