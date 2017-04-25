require 'fog/core/model'

module Fog
  module Storage
    class Artifactory
      class File < Fog::Model
        identity :key, aliases: 'path'

        attribute :checksums
        attribute :original_checksums, aliases: 'originalChecksums'
        attribute :created, type: :time
        attribute :created_by, aliases: 'createdBy'
        attribute :download_uri, aliases: 'downloadUri'
        attribute :last_modified, aliases: 'lastModified', type: :time
        attribute :last_updated, aliases: 'lastUpdated', type: :time
        attribute :content_type, aliases: %w(mimeType mime_type)
        attribute :modified_by, aliases: 'modifiedBy'
        attribute :repo
        attribute :content_length, aliases: 'size', type: :integer
        attribute :uri

        def body
          return attributes[:body] if attributes[:body]
          return '' unless last_modified
          attributes[:body] = service.client.get(download_uri)
        end

        def body=(new_body)
          attributes[:body] = new_body
        end

        def directory
          @directory
        end

        def destroy
          requires :directory, :key
          service.client.delete(download_uri)
          true
        end

        def save(_options = {})
          requires :body, :directory, :key
          endpoint = ::File.join(attributes[:directory].key, attributes[:key])

          service.client.put(endpoint, attributes[:body])
          true
        end

        def public_url
          requires :directory, :key
          download_uri
        end
        alias_method :url, :public_url

        def download_uri
          return attributes[:download_uri] if attributes[:download_uri].present?
          requires :directory, :key
          ::File.join(service.client.endpoint, attributes[:directory].key, attributes[:key])
        end
      end
    end
  end
end
