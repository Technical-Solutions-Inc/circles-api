class EventIconsBuilder
  attr_reader :events, :start_id, :count

  DEFAULT_COUNT = 50

  def initialize(user_id:, start_id: 0, count: DEFAULT_COUNT)
    @user_id = user_id
    @start_id = start_id.to_i
    @count = define_count(count: count)
    @events = User.find(user_id).events.limit(count).offset(start_id)
  end

  def build_payload
    {
      start_id: start_id,
      count: count,
      events: event_icons
    }
  end

  private

  def event_icons
    events.each_with_index.map do |event, index|
      # The index + start_id means if you ask for start_id 30, then the first event in 
      # the returned payload will be 30.  It counts upwards from there to stop at
      # start_id + count.
      event.to_icon(event_number: index + start_id)
    end
  end

  def define_count(count:)
    # Because params give "nil" values, we need to convert to integer or use the Default constant above
    count ? count.to_i : DEFAULT_COUNT
  end
end