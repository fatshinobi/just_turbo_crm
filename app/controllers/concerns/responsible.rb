module Responsible

  private

  def respond_for_update(path_after_index, path_after_edit, object_name)
    case prev_action
      when 'index' then respond_with_item(path_after_index, object_name)
      when 'edit' then redirect_to path_after_edit
    end
  end

  def respond_for_cancel()
    case prev_action
      when 'index' then true
      when 'show' then false
    end
  end

  def prev_action
    prev_url = Rails.application.routes.recognize_path(request.referrer)
    return 'index' if prev_url[:controller] != controller_name
    prev_url[:action]
  end

  def respond_with_item(path_to, item_name)
    operation_name =
      case action_name
        when 'create' then 'created'
        when 'update' then 'updated'
        when 'destroy' then 'destroyed'
      end

    response_msg = "#{item_name} was successfully #{operation_name}"
    respond_to do |format|
      format.html { redirect_to path_to, notice: response_msg }
      format.turbo_stream { flash.now[:notice] = response_msg }
    end
  end

end