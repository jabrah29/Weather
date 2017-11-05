##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class QueueList < ListResource
            ##
            # Initialize the QueueList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @return [QueueList] QueueList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/Queues.json"
            end

            ##
            # Lists QueueInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams QueueInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size],)

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields QueueInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size],)

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of QueueInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of QueueInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              QueuePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of QueueInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of QueueInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              QueuePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of QueueInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name A user-provided string that identifies this queue.
            # @param [String] max_size The upper limit of calls allowed to be in the queue.
            #   The default is 100. The maximum is 1000.
            # @return [QueueInstance] Newly created QueueInstance
            def create(friendly_name: nil, max_size: :unset)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, 'MaxSize' => max_size,})

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              QueueInstance.new(@version, payload, account_sid: @solution[:account_sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.QueueList>'
            end
          end

          class QueuePage < Page
            ##
            # Initialize the QueuePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [QueuePage] QueuePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of QueueInstance
            # @param [Hash] payload Payload response from the API
            # @return [QueueInstance] QueueInstance
            def get_instance(payload)
              QueueInstance.new(@version, payload, account_sid: @solution[:account_sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.QueuePage>'
            end
          end

          class QueueContext < InstanceContext
            ##
            # Initialize the QueueContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] sid The queue Sid that uniquely identifies this resource
            # @return [QueueContext] QueueContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid, sid: sid,}
              @uri = "/Accounts/#{@solution[:account_sid]}/Queues/#{@solution[:sid]}.json"

              # Dependents
              @members = nil
            end

            ##
            # Fetch a QueueInstance
            # @return [QueueInstance] Fetched QueueInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              QueueInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid],)
            end

            ##
            # Update the QueueInstance
            # @param [String] friendly_name A human readable description of the queue
            # @param [String] max_size The maximum number of members that can be in the queue
            #   at a time
            # @return [QueueInstance] Updated QueueInstance
            def update(friendly_name: :unset, max_size: :unset)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, 'MaxSize' => max_size,})

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              QueueInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid],)
            end

            ##
            # Deletes the QueueInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the members
            # @return [MemberList]
            # @return [MemberContext] if call_sid was passed.
            def members(call_sid=:unset)
              raise ArgumentError, 'call_sid cannot be nil' if call_sid.nil?

              if call_sid != :unset
                return MemberContext.new(@version, @solution[:account_sid], @solution[:sid], call_sid,)
              end

              unless @members
                @members = MemberList.new(@version, account_sid: @solution[:account_sid], queue_sid: @solution[:sid],)
              end

              @members
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.QueueContext #{context}>"
            end
          end

          class QueueInstance < InstanceResource
            ##
            # Initialize the QueueInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The account_sid
            # @param [String] sid The queue Sid that uniquely identifies this resource
            # @return [QueueInstance] QueueInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'average_wait_time' => payload['average_wait_time'].to_i,
                  'current_size' => payload['current_size'].to_i,
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'max_size' => payload['max_size'].to_i,
                  'sid' => payload['sid'],
                  'uri' => payload['uri'],
              }

              # Context
              @instance_context = nil
              @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'],}
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [QueueContext] QueueContext for this QueueInstance
            def context
              unless @instance_context
                @instance_context = QueueContext.new(@version, @params['account_sid'], @params['sid'],)
              end
              @instance_context
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] Average wait time of members in the queue
            def average_wait_time
              @properties['average_wait_time']
            end

            ##
            # @return [String] The count of calls currently in the queue.
            def current_size
              @properties['current_size']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] A user-provided string that identifies this queue.
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The max number of calls allowed in the queue
            def max_size
              @properties['max_size']
            end

            ##
            # @return [String] A string that uniquely identifies this queue
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The uri
            def uri
              @properties['uri']
            end

            ##
            # Fetch a QueueInstance
            # @return [QueueInstance] Fetched QueueInstance
            def fetch
              context.fetch
            end

            ##
            # Update the QueueInstance
            # @param [String] friendly_name A human readable description of the queue
            # @param [String] max_size The maximum number of members that can be in the queue
            #   at a time
            # @return [QueueInstance] Updated QueueInstance
            def update(friendly_name: :unset, max_size: :unset)
              context.update(friendly_name: friendly_name, max_size: max_size,)
            end

            ##
            # Deletes the QueueInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the members
            # @return [members] members
            def members
              context.members
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.QueueInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.QueueInstance #{values}>"
            end
          end
        end
      end
    end
  end
end