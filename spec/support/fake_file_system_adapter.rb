class FakeFileSystemAdapter
  def get_league(id)
    File.open(Rails.root.join("spec/fixtures/stats.com/team_info.xml")).read
  end

  def get_leagues
    [get_league(1)]
  end

  def get_schedule(id)
    File.open(Rails.root.join("spec/fixtures/stats.com/schedule.xml")).read
  end

  def get_schedules
    [get_schedule(1)]
  end
end
