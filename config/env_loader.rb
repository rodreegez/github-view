require 'yaml'
class ENVLoader
  def self.load(env)
    array_from_yaml_file(env).each do |key,value|
        ENV[key.to_s] = value.to_s
    end
  end

  def self.clear(env="development")
    array_from_yaml_file(env).each do |key,value|
      ENV.delete(key.to_s)
    end
  end

  private

  def self.array_from_yaml_file(env)
    yml = File.expand_path('../env.yml', __FILE__)
    return [] unless File.exists? yml
    Array(YAML.load_file(yml)[env])
  end

end
