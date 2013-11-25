Rails.application.config.middleware.insert_after ActionDispatch::Session::CookieStore,
  Faye::RackAdapter,
  :mount      => '/faye',
  :timeout    => 25
