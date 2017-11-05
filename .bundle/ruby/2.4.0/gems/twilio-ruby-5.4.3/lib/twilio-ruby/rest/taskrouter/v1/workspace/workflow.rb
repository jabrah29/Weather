##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkflowList < ListResource
            ##
            # Initialize the WorkflowList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [WorkflowList] WorkflowList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid}
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows"
            end

            ##
            # Lists WorkflowInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] friendly_name The friendly_name
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(friendly_name: :unset, limit: nil, page_size: nil)
              self.stream(friendly_name: friendly_name, limit: limit, page_size: page_size).entries
            end

            ##
            # Streams WorkflowInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] friendly_name The friendly_name
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(friendly_name: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(friendly_name: friendly_name, page_size: limits[:page_size],)

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields WorkflowInstance records from the API.
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
            # Retrieve a single page of WorkflowInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name The friendly_name
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of WorkflowInstance
            def page(friendly_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              WorkflowPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of WorkflowInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of WorkflowInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              WorkflowPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of WorkflowInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name The friendly_name
            # @param [String] configuration The configuration
            # @param [String] assignment_callback_url The assignment_callback_url
            # @param [String] fallback_assignment_callback_url The
            #   fallback_assignment_callback_url
            # @param [String] task_reservation_timeout The task_reservation_timeout
            # @return [WorkflowInstance] Newly created WorkflowInstance
            def create(friendly_name: nil, configuration: nil, assignment_callback_url: :unset, fallback_assignment_callback_url: :unset, task_reservation_timeout: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'Configuration' => configuration,
                  'AssignmentCallbackUrl' => assignment_callback_url,
                  'FallbackAssignmentCallbackUrl' => fallback_assignment_callback_url,
                  'TaskReservationTimeout' => task_reservation_timeout,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              WorkflowInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.WorkflowList>'
            end
          end

          class WorkflowPage < Page
            ##
            # Initialize the WorkflowPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [WorkflowPage] WorkflowPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of WorkflowInstance
            # @param [Hash] payload Payload response from the API
            # @return [WorkflowInstance] WorkflowInstance
            def get_instance(payload)
              WorkflowInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.WorkflowPage>'
            end
          end

          class WorkflowContext < InstanceContext
            ##
            # Initialize the WorkflowContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [WorkflowContext] WorkflowContext
            def initialize(version, workspace_sid, sid)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid, sid: sid,}
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows/#{@solution[:sid]}"

              # Dependents
              @statistics = nil
              @real_time_statistics = nil
              @cumulative_statistics = nil
            end

            ##
            # Fetch a WorkflowInstance
            # @return [WorkflowInstance] Fetched WorkflowInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              WorkflowInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], sid: @solution[:sid],)
            end

            ##
            # Update the WorkflowInstance
            # @param [String] friendly_name The friendly_name
            # @param [String] assignment_callback_url The assignment_callback_url
            # @param [String] fallback_assignment_callback_url The
            #   fallback_assignment_callback_url
            # @param [String] configuration The configuration
            # @param [String] task_reservation_timeout The task_reservation_timeout
            # @return [WorkflowInstance] Updated WorkflowInstance
            def update(friendly_name: :unset, assignment_callback_url: :unset, fallback_assignment_callback_url: :unset, configuration: :unset, task_reservation_timeout: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'AssignmentCallbackUrl' => assignment_callback_url,
                  'FallbackAssignmentCallbackUrl' => fallback_assignment_callback_url,
                  'Configuration' => configuration,
                  'TaskReservationTimeout' => task_reservation_timeout,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              WorkflowInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], sid: @solution[:sid],)
            end

            ##
            # Deletes the WorkflowInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the statistics
            # @return [WorkflowStatisticsList]
            # @return [WorkflowStatisticsContext]
            def statistics
              WorkflowStatisticsContext.new(@version, @solution[:workspace_sid], @solution[:sid],)
            end

            ##
            # Access the real_time_statistics
            # @return [WorkflowRealTimeStatisticsList]
            # @return [WorkflowRealTimeStatisticsContext]
            def real_time_statistics
              WorkflowRealTimeStatisticsContext.new(@version, @solution[:workspace_sid], @solution[:sid],)
            end

            ##
            # Access the cumulative_statistics
            # @return [WorkflowCumulativeStatisticsList]
            # @return [WorkflowCumulativeStatisticsContext]
            def cumulative_statistics
              WorkflowCumulativeStatisticsContext.new(@version, @solution[:workspace_sid], @solution[:sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.WorkflowContext #{context}>"
            end
          end

          class WorkflowInstance < InstanceResource
            ##
            # Initialize the WorkflowInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [WorkflowInstance] WorkflowInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'assignment_callback_url' => payload['assignment_callback_url'],
                  'configuration' => payload['configuration'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'document_content_type' => payload['document_content_type'],
                  'fallback_assignment_callback_url' => payload['fallback_assignment_callback_url'],
                  'friendly_name' => payload['friendly_name'],
                  'sid' => payload['sid'],
                  'task_reservation_timeout' => payload['task_reservation_timeout'].to_i,
                  'workspace_sid' => payload['workspace_sid'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'workspace_sid' => workspace_sid, 'sid' => sid || @properties['sid'],}
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [WorkflowContext] WorkflowContext for this WorkflowInstance
            def context
              unless @instance_context
                @instance_context = WorkflowContext.new(@version, @params['workspace_sid'], @params['sid'],)
              end
              @instance_context
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The assignment_callback_url
            def assignment_callback_url
              @properties['assignment_callback_url']
            end

            ##
            # @return [String] The configuration
            def configuration
              @properties['configuration']
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
            # @return [String] The document_content_type
            def document_content_type
              @properties['document_content_type']
            end

            ##
            # @return [String] The fallback_assignment_callback_url
            def fallback_assignment_callback_url
              @properties['fallback_assignment_callback_url']
            end

            ##
            # @return [String] The friendly_name
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The task_reservation_timeout
            def task_reservation_timeout
              @properties['task_reservation_timeout']
            end

            ##
            # @return [String] The workspace_sid
            def workspace_sid
              @properties['workspace_sid']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] The links
            def links
              @properties['links']
            end

            ##
            # Fetch a WorkflowInstance
            # @return [WorkflowInstance] Fetched WorkflowInstance
            def fetch
              context.fetch
            end

            ##
            # Update the WorkflowInstance
            # @param [String] friendly_name The friendly_name
            # @param [String] assignment_callback_url The assignment_callback_url
            # @param [String] fallback_assignment_callback_url The
            #   fallback_assignment_callback_url
            # @param [String] configuration The configuration
            # @param [String] task_reservation_timeout The task_reservation_timeout
            # @return [WorkflowInstance] Updated WorkflowInstance
            def update(friendly_name: :unset, assignment_callback_url: :unset, fallback_assignment_callback_url: :unset, configuration: :unset, task_reservation_timeout: :unset)
              context.update(
                  friendly_name: friendly_name,
                  assignment_callback_url: assignment_callback_url,
                  fallback_assignment_callback_url: fallback_assignment_callback_url,
                  configuration: configuration,
                  task_reservation_timeout: task_reservation_timeout,
              )
            end

            ##
            # Deletes the WorkflowInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the statistics
            # @return [statistics] statistics
            def statistics
              context.statistics
            end

            ##
            # Access the real_time_statistics
            # @return [real_time_statistics] real_time_statistics
            def real_time_statistics
              context.real_time_statistics
            end

            ##
            # Access the cumulative_statistics
            # @return [cumulative_statistics] cumulative_statistics
            def cumulative_statistics
              context.cumulative_statistics
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkflowInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkflowInstance #{values}>"
            end
          end
        end
      end
    end
  end
end