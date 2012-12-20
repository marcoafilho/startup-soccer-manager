module ApplicationHelper
  def active_controller(controller_name)
    controller.controller_name == controller_name ? "active" : ""
  end
end
