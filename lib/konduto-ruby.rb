class KondutoRuby
  require 'uri'
  require 'base64'
  require 'net/http'
  require 'konduto-ruby/konduto_order'
  attr_accessor :request_body, :response_body, :endpoint
  attr_reader :api_key

  def initialize api_key, endpoint = 'https://api.konduto.com/v1'
    @endpoint = URI.parse(endpoint)
    @http_client = Net::HTTP.new(@endpoint.host, @endpoint.port)
    @api_key = api_key
  end

  def api_key= api_key
    if api_key.length == 21
      @api_key = api_key
    else
      raise ArgumentError.new "Invalid key: #{api_key}! API key length must be of 21"
    end
  end

  def proxy
    return @proxy if @proxy
    URI.parse(ENV['http_proxy']) rescue nil
  end

  def proxy= proxy_url
    @proxy = URI.parse(proxy_url)
  end

  def order_url order_id=''
    url = "#{@endpoint}/orders"
    url += "/#{order_id}" unless order_id == ''
    URI.parse(url)
  end

  def send_request http_method, request_body=''
    headers = {
      'Authorization' => "Basic #{Base64.encode64(@api_key)}",
      'Content-Type' =>'application/json',
      'Referer' => @endpoint.path
    }
    http_method.initialize_http_header headers
    http_method.body = request_body
    if proxy
      http = Net::HTTP::Proxy(proxy.host, proxy.port).new(@endpoint.host, @endpoint.port)
    else
      http = Net::HTTP.new(@endpoint.host, @endpoint.port)
    end
    http.use_ssl = true
    response = http.request(http_method)

    response
  end

  def get_order order_id
    get = Net::HTTP::Get.new(order_url(order_id))
    response = send_request(get)

    if response.kind_of? Net::HTTPSuccess
      order = KondutoOrder.new JSON.parse(response.entity)['order']
      order.id = order_id unless order.id
      return order
    else
      raise (JSON.parse(response.body)['message']).to_s
    end


  end

  def analyze order
    post = Net::HTTP::Post.new(order_url)
    response = send_request(post, order.to_json)

    if response.kind_of? Net::HTTPSuccess
      return KondutoOrder.new JSON.parse(response.entity)['order']
    else
      raise (JSON.parse(response.body)['message']).to_s
    end
  end

  def update_order_status order, new_status, comments
    raise ArgumentError("Illegal status #{new_status}") unless KondutoOrderStatus.allowed_status.include? new_status
    raise ArgumentError("Commets can't be nil") unless comments

    put = Net::HTTP::Put.new(order_url(order.id))
    body = {status: new_status.downcase, comments: comments}.to_json
    response = send_request(put, body)

    if response.kind_of? Net::HTTPSuccess
      resposta = JSON.parse(response.entity)['order']
      raise 'Update order status can\'t be done' if resposta['old_status'].nil? && resposta['new_status'].nil?
      order.status = resposta['new_status']
      return order
    else
      raise (JSON.parse(response.body)['message']).to_s
    end
  end
end
