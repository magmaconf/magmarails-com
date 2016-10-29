class SiteController < ApplicationController
  include HighVoltage::StaticPage
  before_filter :set_year
  before_filter :init_magmaconf_api_service

  layout :set_layout

  def send_email
    TransactionMailer.sponsor_mail(params).deliver
    render nothing: true
  end

  def speakers
    @id = 'speakers'
    speakers_response = @magmaconf_service.get_speakers
    if is_response_ok? speakers_response
      @speakers_data = {
        keynotes: get_keynotes(speakers_response),
        speakers: get_speakers(speakers_response)
      }
    else
      @speakers = {}
    end
    render "site/#{sanitize_year}/speakers.html.haml"
  end

  def schedule
    @id = 'schedule'
    @schedule_data = {
      schedule: set_schedule(@magmaconf_service.get_schedule),
      events: set_events(@magmaconf_service.get_events)
    }
    render "site/#{sanitize_year}/schedule.html.haml"
  end

  private

  def init_magmaconf_api_service
    @magmaconf_service||= MagmaconfApiService.new
  end

  def set_layout
    @year = sanitize_year
    "#{sanitize_year}/application"
  end

  def sanitize_year
    params[:year] ||= ENV["DEFAULT_YEAR"]
  end

  def set_year
    @year = sanitize_year
  end

  def is_response_ok? response
    response[:status] == MagmaconfApiService::HTTP_SUCCESS_CODE
  end

  def get_keynotes speakers_response
    JSON.parse(speakers_response[:data]).fetch('speakers', {}).keep_if do |speaker|
      speaker["is_keynote"]
    end
  end

  def get_speakers speakers_response
    JSON.parse(speakers_response[:data]).fetch('speakers', {}).keep_if do |speaker|
      !speaker["is_keynote"]
    end
  end

  def set_events events_response
    if is_response_ok? events_response
      events = JSON.parse(events_response[:data])['events']
      events.map { |v| v['date'] }.sort
      events.each do |e|
        e['day_name'] = Date.parse(e['date']).strftime("%A")
      end
    else
      events = {}
    end
    events
  end

  def set_schedule schedule_response
    if is_response_ok? schedule_response
      schedule = JSON.parse(schedule_response[:data])['schedules']
      schedule.map{|s| [s["name"], s["talks"].group_by{|x|x["event_date"]} ] }
    else
      schedule = {}
    end
  end

end
