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

  def get_roster(id)
    File.open(Rails.root.join("spec/fixtures/stats.com/roster.xml")).read
  end

  def get_rosters
    [get_roster(1)]
  end

  def get_event_codes
    File.open(Rails.root.join("spec/fixtures/stats.com/event_code.xml")).read
  end
end
