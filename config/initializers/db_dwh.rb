# save stats database settings in global var
DB_DWH = YAML::load(ERB.new(File.read(Rails.root.join("config","database_dwh.yml"))).result)[Rails.env]