alias :require_original :require
def require(path)
  path = File.expand_path(path) if path.to_s.match(/^file:/)
  require_original path
rescue Exception => e
  raise e unless path.to_s.match(/^file:/)
end

alias :load_original :load
def load(path)
  path = File.expand_path(path) if path.to_s.match(/^file:/)
  load_original path
rescue Exception => e
  raise e unless path.to_s.match(/^file:/)
end    

class Dir
  class << self
    alias :aref_original :[]
    def [](*args)
      aref_original *(args.map do |path|
        path.to_s.match(/^file:/) ? File.expand_path(path) : path
      end)
    end
  end
end
