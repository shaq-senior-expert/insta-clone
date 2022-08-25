#how to config the file >> https://rubydoc.info/gems/carrierwave/frames

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "Google",
    google_storage_access_key_id: ENV["GOOGLE_ACCESS_KEY_ID"],
    google_storage_secret_access_key: ENV["GOOGLE_SECRET_ACCESS_KEY"],
  }
  config.fog_directory = ENV["FOG_DIRECTORY"]
end
