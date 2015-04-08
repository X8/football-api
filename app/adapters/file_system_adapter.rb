class FileSystemAdapter
  NotFound = Class.new(StandardError)

  def initialize(root)
    @root = root
  end

  def get_league(id)
    read("team_info/#{id}.xml")
  end

  def get_leagues
    Dir[@root.join("team_info/*.xml")].map { |path| File.read(path) }
  end

  private

  def read(path)
    File.open(File.join(@root, path)).read
  rescue Errno::ENOENT
    raise NotFound
  end
end
