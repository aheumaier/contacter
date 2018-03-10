OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '477177384364-4g1rdmun34u10m38f76ncuhpog6qnr3d.apps.googleusercontent.com', 'WQX5BXpz1djXdbwehkm_rqZP',
           {
               scope: 'email, profile',
               image_aspect_ratio: 'square',
               image_size: 160,
               client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}
           }
end
