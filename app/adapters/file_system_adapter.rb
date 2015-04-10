class FileSystemAdapter
  NotFound = Class.new(StandardError)

  def initialize(root)
    @root = root
  end

  def get_league(id)
    read("team_info/#{id}.xml")
  end

  def get_leagues
    list("team_info/*.xml")
  end

  def get_schedule(id)
    read("schedule/#{id}.xml")
  end

  def get_schedules
    list("schedule/*.xml")
  end

  private

  def list(path)
    Dir[@root.join(path)].map { |path| File.read(path) }
  end

  def read(path)
    File.open(File.join(@root, path)).read
  rescue Errno::ENOENT
    raise NotFound
  end
end
