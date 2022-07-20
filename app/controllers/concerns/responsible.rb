module Responsible

  private

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