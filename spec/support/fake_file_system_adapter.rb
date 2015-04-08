class FakeFileSystemAdapter
  def get_league(id)
    File.open(Rails.root.join("spec/fixtures/stats.com/team_info.xml")).read
  end

  def get_leagues
    [get_league(1)]
  end
end
