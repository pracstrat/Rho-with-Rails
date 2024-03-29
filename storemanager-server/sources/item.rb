class Item < SourceAdapter
  def initialize(source) 
    @host = 'http://localhost:3000'
    @base = @host + '/items/all'
    super(source)
  end
 
  def login
    # TODO: Login to your data source here if necessary
  end
 
  def query(params=nil)
    parsed=JSON.parse(RestClient.get("#{@base}.json").body)
    @result={}
    if parsed
      parsed.each do |item| 
        key = item["id"].to_s      
        @result[key]= item
      end
    end 
  end
 
  def sync
    # Manipulate @result before it is saved, or save it 
    # yourself using the Rhoconnect::Store interface.
    # By default, super is called below which simply saves @result
    super
  end
 
  def create(create_hash)
    result = RestClient.post(@base, :item => create_hash)

    # after create we are redirected to the new record.
    # The URL of the new record is given in the location header

    # We need to get the id of that record and return it as part of create
    # so rhoconnect can establish a link from its temporary object on the
    # client to this newly created object on the server

    new_record = RestClient.get("#{result.headers[:location]}.json").body
    JSON.parse(new_record)["item"]["id"].to_s
  end
 
  def update(update_hash)
    RestClient.put("#{@base}/#{update_hash['id']}", :item => update_hash)    
  end
 
  def delete(delete_hash)
    RestClient.delete("#{@base}/#{delete_hash['id']}")
  end
 
  def logoff
    # TODO: Logout from the data source if necessary
  end
end