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
          service.client.delete(attributes[:download_uri])
          true
        rescue Error::HTTPError
          false
        end

        def save(_options = {})
          requires :body, :directory, :key
          endpoint = ::File.join(attributes[:repo], attributes[:key])

          service.client.put(endpoint, attributes[:body])
          true
        end

        def public_url
          requires :directory, :key
          self.download_uri
        end
        alias_method :url, :public_url

        # def url
        #   # TODO: implement
        # end
      end
    end
  end
end
