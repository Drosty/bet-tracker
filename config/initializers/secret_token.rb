secret = Rails.env.production? ? ENV['SECRET_TOKEN'] : "NOTSECURE1731e3c1051c26d43229568123ced83f311fc482f8649ec272ae09d203f8422da2acec23ad0d37cc6f99dd28f96e166fb4f4f4a92dc03686c2aa9f971eca65e94"
Bettracker::Application.config.secret_key_base = secret
