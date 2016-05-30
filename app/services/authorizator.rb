class Authorizator
  def allowed_to_log_in?(user)
    require 'yaml'

    data = YAML.load_file "config/allowed_users.yml"
    allowed_users = data["allowed_users"]
    allowed_users.include?(user.email)
  end
end
