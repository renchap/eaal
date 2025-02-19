# EAAL::Cache::FileCache
# File based xml cache which respects the cachedUntil of the Eve API
# Usage:
#  EAAL.cache = EAAL::Cache::FileCache.new
# Or
#  EAAL.cache = EAAL::Cache::FileCache.new("/path/to/place/to/store/xml/data")
class EAAL::Cache::FileCache
  attr_accessor :basepath
  
  # constructor, takes one argument which is the path
  # where files should be written
  # * basepath (String) path which should be used to store cached data. defaults to $HOME/.eaal/cache/
  def initialize(basepath = "#{ENV['HOME']}/.eaal/cache")
    if basepath[(basepath.length) -1, basepath.length] != "/"
      basepath += "/" 
    end
    @basepath = basepath
  end
  
  # create the path/filename for the cache file
  def filename(keyid, vcode, scope, name, args)
    ret =""
    args.delete_if { |k,v| (v || "").to_s.length == 0 }
    h = args.stringify_keys
    ret += h.sort.flatten.collect{ |e| e.to_s }.join(':')
    hash = ret.gsub(/:$/,'')
    "#{@basepath}#{keyid}/#{vcode}/#{scope}/#{name}/Request_#{hash}.xml"
  end
  
  # load xml if available, return false if not available, or cachedUntil ran out
  def load(keyid, vcode, scope, name, args)
    filename = self.filename(keyid, vcode,scope,name,args)
    if not File.exist?(filename)
      ret = false
    else
      xml = File.open(filename).read
      if self.validate_cache(xml, name)
        ret = xml
      else
        ret = false
      end
    end
    ret
  end
  
  # validate cached datas cachedUntil
  def validate_cache(xml, name)
    doc = Hpricot.XML(xml)
    if name == "WalletJournal"
            Time.at((doc/"/eveapi/cachedUntil").inner_html.to_time.to_i + 3600) > Time.now
          else 
      (doc/"/eveapi/cachedUntil").inner_html.to_time > Time.now
    end
  end
  
  # save xml data to file
  def save(keyid, vcode, scope, name, args, xml)
    filename = self.filename(keyid, vcode,scope,name,args)
    FileUtils.mkdir_p(File.dirname(filename))
    File.open(filename,'w') { |f| f.print xml }        
  end
end
