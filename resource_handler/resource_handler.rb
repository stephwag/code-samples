module Concerns::ResourceHandler
  extend ActiveSupport::Concern

  def render_result
    respond_to do |format|
      format.html
      format.js { render layout: false, content_type: 'text/javascript' }
      format.json { render json: resource.to_json }
    end
  end

  def render_save_result(url: nil, message: "")
    respond_to do |format|
      if resource.save
        format.html
        format.js { render layout: false, content_type: 'text/javascript' }
        format.json { render json: { success: true } }
      else
        format.html { render partial: 'errors', locals: { errors: resource.errors }  }
        format.js { render partial: 'errors', locals: { errors: resource.errors }, layout: false, content_type: 'text/javascript' }
        format.json { render json: { success: false } }
      end
    end
  end

  def render_destroy_result
    respond_to do |format|
      if resource.destroy
        format.html
        format.js { render layout: false, partial: 'destroy', locals: { resource: resource }, content_type: 'text/javascript' }
        format.json { render json: { success: true } }
      else
        format.html { render partial: 'errors', locals: { errors: resource.errors } }
        format.js { render partial: 'errors', locals: { errors: resource.errors }, layout: false, content_type: 'text/javascript' }
        format.json { render json: { success: false } }
      end
    end
  end
end