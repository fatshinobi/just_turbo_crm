module ApplicationHelper
  def render_turbo_stream_flash_message
    turbo_stream.prepend 'flash', partial: 'shared/flash'
  end

  def select_data_from_array(array_of_values)
    array_of_values.each_with_index.map{ |name, index| OpenStruct.new(caption: name, value: index) }
  end
end
