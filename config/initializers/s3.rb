S3_CREDENTIALS = YAML.load_file("#{Rails.root}/config/s3.yml").symbolize_keys
