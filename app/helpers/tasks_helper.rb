module TasksHelper
  # message out-of-time
  def message
    if Time.now > @task.deadline && !@task.completed?
      "Please Hurry Up"
    end
  end
end
