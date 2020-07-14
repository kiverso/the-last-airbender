class SearchController < ApplicationController
  def index
    @nation_members = NationMembers.from_api(params['nation'])
  end
end