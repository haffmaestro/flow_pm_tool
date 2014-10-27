module ProjectsHelper

  def project_user_display(project)
    if project.user
      project.user.user_name
    else
      "Darth Vader"
    end
  end
end
