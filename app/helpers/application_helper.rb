module ApplicationHelper
  def current_class?(test_path)
    return 'current' if request.path == test_path
    ''
  end
end
