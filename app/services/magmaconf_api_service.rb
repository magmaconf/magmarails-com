class MagmaconfApiService

  # Response status
  HTTP_SUCCESS_CODE = 200
  ERROR = 1

  def initialize
    @base_url =  ENV['MAGMACONF_API_URL']
  end

  def handle_http_errors
    begin
      yield
    rescue Net::OpenTimeout, Net::ReadTimeout, RestClient::Exception
      { status: ERROR, data: {}}
    end
  end

  def get_events
    handle_http_errors do
      get_response 'v1/events'
    end
  end

  def get_speakers
    handle_http_errors do
      get_response 'v1/speakers'
    end
  end

  def get_schedule
    handle_http_errors do
      get_response 'v1/schedules'
    end
  end

  private

    def get_response url
      response = RestClient.get("#{@base_url}/#{url}")
      { status: response.code, data: response.body }
    end

end
