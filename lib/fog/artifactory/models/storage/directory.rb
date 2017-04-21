require 'fog/core/model'
require 'fog/artifactory/models/storage/files'

module Fog
  module Storage
    class Artifactory
      class Directory < Fog::Model
        identity :key

        attribute :description
        attribute :url

        def destroy
          false
        end

        def files
          requires :key
          @files ||= begin
            service.client.get('/api/search/artifact', name: '.*', repos: key)['results'].map do |artifact|
              path = URI.parse(artifact['uri']).path
              endpoint_path = URI.parse(service.client.endpoint).path
              path.slice!(endpoint_path)
              service.client.get(path)
              # Fog::Storage::Artifactory::Files.new(
              #   directory: self, service: service
              # )
            end
          end
        end

        def save
          true
        end
      end
    end
  end
end
