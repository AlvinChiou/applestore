# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_applestore_session'

# Rails.application.config.session_store = :redis_store, {host: "localhost",
#                                                         port: 6379,
#                                                         db: 0,
#                                                         password: "mysecret",
#                                                         namespace: "cache",
#                                                         expires_in: 90.minutes}

# Rails.application.config.session_store :redis_store, servers: {host: "localhost",
#                                                                port: 6379,
#                                                                db: 0,
#                                                                password: "mysecret",
#                                                                namespace: "session"
#                                                               }, expires_in: 90.minutes