class Clip < ActiveRecord::Base

  def json_url
    url << ".json"
  end

  def data
    if @data.nil?
      @data = JSON.parse(HTTParty.get(json_url).body)
    end

    # XXX we're assuming everything is JSON, so anything else will break
    @data
  end

  def fields
    data["fields"]
  end

  def labels
    data["values"].collect {|tuple| tuple[0] }
  end

  def series
    data["values"].collect {|tuple| tuple[1].to_i }
  end
end
