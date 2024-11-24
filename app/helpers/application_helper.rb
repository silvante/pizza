module ApplicationHelper
  def show_header?
    # Customize this array to include actions where the header should be hidden
    hidden_devise_actions = %w[new create edit update]
    hidden_devise_controllers = %w[registrations sessions confirmations passwords unlocks]

    !hidden_devise_controllers.include?(controller_name) ||
      !hidden_devise_actions.include?(action_name)
  end
end
