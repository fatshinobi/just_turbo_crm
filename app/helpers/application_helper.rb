module ApplicationHelper
  def render_turbo_stream_flash_message
    turbo_stream.prepend 'flash', partial: 'shared/flash'
  end
end
