module Fog
  module Storage
    class Artifactory < Fog::Service
      autoload :Directories, ::File.expand_path('../models/storage/directories', __FILE__)
      autoload :Directory, ::File.expand_path('../models/storage/directory', __FILE__)
      autoload :File, ::File.expand_path('../models/storage/file', __FILE__)
      autoload :Files, ::File.expand_path('../models/storage/files', __FILE__)

      requires   :endpoint
      recognizes :username, :password, :api_key, :ssl_perm_file, :ssl_verify,
                 :proxy_username, :proxy_password, :proxy_address, :proxy_port,
                 :host, :port, :scheme, :persistent, :path_style
      secrets    :password, :api_key

      model_path 'fog/artifactory/models/storage'
      collection :directories
      model      :directory
      model      :file
      collection :files

      class Mock
        def initialize(options = {})
        end
      end

      class Real
        def initialize(options = {})
          @artifactory_client = ::Artifactory::Client.new(options)
        end

        def client
          @artifactory_client
        end
      end
    end
  end
end
