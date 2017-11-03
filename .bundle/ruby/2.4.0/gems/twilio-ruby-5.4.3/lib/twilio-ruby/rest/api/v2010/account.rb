##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountList < ListResource
          ##
          # Initialize the AccountList
          # @param [Version] version Version that contains the resource
          # @return [AccountList] AccountList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Accounts.json"
          end

          ##
          # Retrieve a single page of AccountInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name A human readable description of the account to
          #   create, defaults to `SubAccount Created at {YYYY-MM-DD HH:MM meridian}`
          # @return [AccountInstance] Newly created AccountInstance
          def create(friendly_name: :unset)
            data = Twilio::Values.of({'FriendlyName' => friendly_name,})

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            AccountInstance.new(@version, payload,)
          end

          ##
          # Lists AccountInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] friendly_name Filter accounts where the friendly name exactly
          #   matches the desired FriendlyName
          # @param [account.Status] status Only show accounts with the given Status
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(friendly_name: :unset, status: :unset, limit: nil, page_size: nil)
            self.stream(friendly_name: friendly_name, status: status, limit: limit, page_size: page_size).entries
          end

          ##
          # Streams AccountInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name Filter accounts where the friendly name exactly
          #   matches the desired FriendlyName
          # @param [account.Status] status Only show accounts with the given Status
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(friendly_name: :unset, status: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(friendly_name: friendly_name, status: status, page_size: limits[:page_size],)

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields AccountInstance records from the API.
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
          # Retrieve a single page of AccountInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name Filter accounts where the friendly name exactly
          #   matches the desired FriendlyName
          # @param [account.Status] status Only show accounts with the given Status
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of AccountInstance
          def page(friendly_name: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'Status' => status,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            AccountPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of AccountInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of AccountInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            AccountPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Api.V2010.AccountList>'
          end
        end

        class AccountPage < Page
          ##
          # Initialize the AccountPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [AccountPage] AccountPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of AccountInstance
          # @param [Hash] payload Payload response from the API
          # @return [AccountInstance] AccountInstance
          def get_instance(payload)
            AccountInstance.new(@version, payload,)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Api.V2010.AccountPage>'
          end
        end

        class AccountContext < InstanceContext
          ##
          # Initialize the AccountContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Account Sid that uniquely identifies the account to
          #   fetch
          # @return [AccountContext] AccountContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid,}
            @uri = "/Accounts/#{@solution[:sid]}.json"

            # Dependents
            @addresses = nil
            @applications = nil
            @authorized_connect_apps = nil
            @available_phone_numbers = nil
            @calls = nil
            @conferences = nil
            @connect_apps = nil
            @incoming_phone_numbers = nil
            @keys = nil
            @messages = nil
            @new_keys = nil
            @new_signing_keys = nil
            @notifications = nil
            @outgoing_caller_ids = nil
            @queues = nil
            @recordings = nil
            @signing_keys = nil
            @sip = nil
            @short_codes = nil
            @tokens = nil
            @transcriptions = nil
            @usage = nil
            @validation_requests = nil
          end

          ##
          # Fetch a AccountInstance
          # @return [AccountInstance] Fetched AccountInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            AccountInstance.new(@version, payload, sid: @solution[:sid],)
          end

          ##
          # Update the AccountInstance
          # @param [String] friendly_name Update the human-readable description of this
          #   Account
          # @param [account.Status] status Alter the status of this account with a given
          #   Status
          # @return [AccountInstance] Updated AccountInstance
          def update(friendly_name: :unset, status: :unset)
            data = Twilio::Values.of({'FriendlyName' => friendly_name, 'Status' => status,})

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            AccountInstance.new(@version, payload, sid: @solution[:sid],)
          end

          ##
          # Access the addresses
          # @return [AddressList]
          # @return [AddressContext] if sid was passed.
          def addresses(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return AddressContext.new(@version, @solution[:sid], sid,)
            end

            unless @addresses
              @addresses = AddressList.new(@version, account_sid: @solution[:sid],)
            end

            @addresses
          end

          ##
          # Access the applications
          # @return [ApplicationList]
          # @return [ApplicationContext] if sid was passed.
          def applications(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ApplicationContext.new(@version, @solution[:sid], sid,)
            end

            unless @applications
              @applications = ApplicationList.new(@version, account_sid: @solution[:sid],)
            end

            @applications
          end

          ##
          # Access the authorized_connect_apps
          # @return [AuthorizedConnectAppList]
          # @return [AuthorizedConnectAppContext] if connect_app_sid was passed.
          def authorized_connect_apps(connect_app_sid=:unset)
            raise ArgumentError, 'connect_app_sid cannot be nil' if connect_app_sid.nil?

            if connect_app_sid != :unset
              return AuthorizedConnectAppContext.new(@version, @solution[:sid], connect_app_sid,)
            end

            unless @authorized_connect_apps
              @authorized_connect_apps = AuthorizedConnectAppList.new(@version, account_sid: @solution[:sid],)
            end

            @authorized_connect_apps
          end

          ##
          # Access the available_phone_numbers
          # @return [AvailablePhoneNumberCountryList]
          # @return [AvailablePhoneNumberCountryContext] if country_code was passed.
          def available_phone_numbers(country_code=:unset)
            raise ArgumentError, 'country_code cannot be nil' if country_code.nil?

            if country_code != :unset
              return AvailablePhoneNumberCountryContext.new(@version, @solution[:sid], country_code,)
            end

            unless @available_phone_numbers
              @available_phone_numbers = AvailablePhoneNumberCountryList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end

            @available_phone_numbers
          end

          ##
          # Access the calls
          # @return [CallList]
          # @return [CallContext] if sid was passed.
          def calls(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return CallContext.new(@version, @solution[:sid], sid,)
            end

            unless @calls
              @calls = CallList.new(@version, account_sid: @solution[:sid],)
            end

            @calls
          end

          ##
          # Access the conferences
          # @return [ConferenceList]
          # @return [ConferenceContext] if sid was passed.
          def conferences(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ConferenceContext.new(@version, @solution[:sid], sid,)
            end

            unless @conferences
              @conferences = ConferenceList.new(@version, account_sid: @solution[:sid],)
            end

            @conferences
          end

          ##
          # Access the connect_apps
          # @return [ConnectAppList]
          # @return [ConnectAppContext] if sid was passed.
          def connect_apps(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ConnectAppContext.new(@version, @solution[:sid], sid,)
            end

            unless @connect_apps
              @connect_apps = ConnectAppList.new(@version, account_sid: @solution[:sid],)
            end

            @connect_apps
          end

          ##
          # Access the incoming_phone_numbers
          # @return [IncomingPhoneNumberList]
          # @return [IncomingPhoneNumberContext] if sid was passed.
          def incoming_phone_numbers(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return IncomingPhoneNumberContext.new(@version, @solution[:sid], sid,)
            end

            unless @incoming_phone_numbers
              @incoming_phone_numbers = IncomingPhoneNumberList.new(@version, account_sid: @solution[:sid],)
            end

            @incoming_phone_numbers
          end

          ##
          # Access the keys
          # @return [KeyList]
          # @return [KeyContext] if sid was passed.
          def keys(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return KeyContext.new(@version, @solution[:sid], sid,)
            end

            unless @keys
              @keys = KeyList.new(@version, account_sid: @solution[:sid],)
            end

            @keys
          end

          ##
          # Access the messages
          # @return [MessageList]
          # @return [MessageContext] if sid was passed.
          def messages(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return MessageContext.new(@version, @solution[:sid], sid,)
            end

            unless @messages
              @messages = MessageList.new(@version, account_sid: @solution[:sid],)
            end

            @messages
          end

          ##
          # Access the new_keys
          # @return [NewKeyList]
          # @return [NewKeyContext]
          def new_keys
            unless @new_keys
              @new_keys = NewKeyList.new(@version, account_sid: @solution[:sid],)
            end

            @new_keys
          end

          ##
          # Access the new_signing_keys
          # @return [NewSigningKeyList]
          # @return [NewSigningKeyContext]
          def new_signing_keys
            unless @new_signing_keys
              @new_signing_keys = NewSigningKeyList.new(@version, account_sid: @solution[:sid],)
            end

            @new_signing_keys
          end

          ##
          # Access the notifications
          # @return [NotificationList]
          # @return [NotificationContext] if sid was passed.
          def notifications(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return NotificationContext.new(@version, @solution[:sid], sid,)
            end

            unless @notifications
              @notifications = NotificationList.new(@version, account_sid: @solution[:sid],)
            end

            @notifications
          end

          ##
          # Access the outgoing_caller_ids
          # @return [OutgoingCallerIdList]
          # @return [OutgoingCallerIdContext] if sid was passed.
          def outgoing_caller_ids(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return OutgoingCallerIdContext.new(@version, @solution[:sid], sid,)
            end

            unless @outgoing_caller_ids
              @outgoing_caller_ids = OutgoingCallerIdList.new(@version, account_sid: @solution[:sid],)
            end

            @outgoing_caller_ids
          end

          ##
          # Access the queues
          # @return [QueueList]
          # @return [QueueContext] if sid was passed.
          def queues(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return QueueContext.new(@version, @solution[:sid], sid,)
            end

            unless @queues
              @queues = QueueList.new(@version, account_sid: @solution[:sid],)
            end

            @queues
          end

          ##
          # Access the recordings
          # @return [RecordingList]
          # @return [RecordingContext] if sid was passed.
          def recordings(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return RecordingContext.new(@version, @solution[:sid], sid,)
            end

            unless @recordings
              @recordings = RecordingList.new(@version, account_sid: @solution[:sid],)
            end

            @recordings
          end

          ##
          # Access the signing_keys
          # @return [SigningKeyList]
          # @return [SigningKeyContext] if sid was passed.
          def signing_keys(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return SigningKeyContext.new(@version, @solution[:sid], sid,)
            end

            unless @signing_keys
              @signing_keys = SigningKeyList.new(@version, account_sid: @solution[:sid],)
            end

            @signing_keys
          end

          ##
          # Access the sip
          # @return [SipList]
          # @return [SipContext]
          def sip
            unless @sip
              @sip = SipList.new(@version, account_sid: @solution[:sid],)
            end

            @sip
          end

          ##
          # Access the short_codes
          # @return [ShortCodeList]
          # @return [ShortCodeContext] if sid was passed.
          def short_codes(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ShortCodeContext.new(@version, @solution[:sid], sid,)
            end

            unless @short_codes
              @short_codes = ShortCodeList.new(@version, account_sid: @solution[:sid],)
            end

            @short_codes
          end

          ##
          # Access the tokens
          # @return [TokenList]
          # @return [TokenContext]
          def tokens
            unless @tokens
              @tokens = TokenList.new(@version, account_sid: @solution[:sid],)
            end

            @tokens
          end

          ##
          # Access the transcriptions
          # @return [TranscriptionList]
          # @return [TranscriptionContext] if sid was passed.
          def transcriptions(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return TranscriptionContext.new(@version, @solution[:sid], sid,)
            end

            unless @transcriptions
              @transcriptions = TranscriptionList.new(@version, account_sid: @solution[:sid],)
            end

            @transcriptions
          end

          ##
          # Access the usage
          # @return [UsageList]
          # @return [UsageContext]
          def usage
            unless @usage
              @usage = UsageList.new(@version, account_sid: @solution[:sid],)
            end

            @usage
          end

          ##
          # Access the validation_requests
          # @return [ValidationRequestList]
          # @return [ValidationRequestContext]
          def validation_requests
            unless @validation_requests
              @validation_requests = ValidationRequestList.new(@version, account_sid: @solution[:sid],)
            end

            @validation_requests
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Api.V2010.AccountContext #{context}>"
          end
        end

        class AccountInstance < InstanceResource
          ##
          # Initialize the AccountInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Account Sid that uniquely identifies the account to
          #   fetch
          # @return [AccountInstance] AccountInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'auth_token' => payload['auth_token'],
                'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                'friendly_name' => payload['friendly_name'],
                'owner_account_sid' => payload['owner_account_sid'],
                'sid' => payload['sid'],
                'status' => payload['status'],
                'subresource_uris' => payload['subresource_uris'],
                'type' => payload['type'],
                'uri' => payload['uri'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'],}
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [AccountContext] AccountContext for this AccountInstance
          def context
            unless @instance_context
              @instance_context = AccountContext.new(@version, @params['sid'],)
            end
            @instance_context
          end

          ##
          # @return [String] The authorization token for this account
          def auth_token
            @properties['auth_token']
          end

          ##
          # @return [Time] The date this account was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date this account was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] A human readable description of this account
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] The unique 34 character id representing the parent of this account
          def owner_account_sid
            @properties['owner_account_sid']
          end

          ##
          # @return [String] A 34 character string that uniquely identifies this resource.
          def sid
            @properties['sid']
          end

          ##
          # @return [account.Status] The status of this account
          def status
            @properties['status']
          end

          ##
          # @return [String] Account Instance Subresources
          def subresource_uris
            @properties['subresource_uris']
          end

          ##
          # @return [account.Type] The type of this account
          def type
            @properties['type']
          end

          ##
          # @return [String] The URI for this resource, relative to `https://api.twilio.com`
          def uri
            @properties['uri']
          end

          ##
          # Fetch a AccountInstance
          # @return [AccountInstance] Fetched AccountInstance
          def fetch
            context.fetch
          end

          ##
          # Update the AccountInstance
          # @param [String] friendly_name Update the human-readable description of this
          #   Account
          # @param [account.Status] status Alter the status of this account with a given
          #   Status
          # @return [AccountInstance] Updated AccountInstance
          def update(friendly_name: :unset, status: :unset)
            context.update(friendly_name: friendly_name, status: status,)
          end

          ##
          # Access the addresses
          # @return [addresses] addresses
          def addresses
            context.addresses
          end

          ##
          # Access the applications
          # @return [applications] applications
          def applications
            context.applications
          end

          ##
          # Access the authorized_connect_apps
          # @return [authorized_connect_apps] authorized_connect_apps
          def authorized_connect_apps
            context.authorized_connect_apps
          end

          ##
          # Access the available_phone_numbers
          # @return [available_phone_numbers] available_phone_numbers
          def available_phone_numbers
            context.available_phone_numbers
          end

          ##
          # Access the calls
          # @return [calls] calls
          def calls
            context.calls
          end

          ##
          # Access the conferences
          # @return [conferences] conferences
          def conferences
            context.conferences
          end

          ##
          # Access the connect_apps
          # @return [connect_apps] connect_apps
          def connect_apps
            context.connect_apps
          end

          ##
          # Access the incoming_phone_numbers
          # @return [incoming_phone_numbers] incoming_phone_numbers
          def incoming_phone_numbers
            context.incoming_phone_numbers
          end

          ##
          # Access the keys
          # @return [keys] keys
          def keys
            context.keys
          end

          ##
          # Access the messages
          # @return [messages] messages
          def messages
            context.messages
          end

          ##
          # Access the new_keys
          # @return [new_keys] new_keys
          def new_keys
            context.new_keys
          end

          ##
          # Access the new_signing_keys
          # @return [new_signing_keys] new_signing_keys
          def new_signing_keys
            context.new_signing_keys
          end

          ##
          # Access the notifications
          # @return [notifications] notifications
          def notifications
            context.notifications
          end

          ##
          # Access the outgoing_caller_ids
          # @return [outgoing_caller_ids] outgoing_caller_ids
          def outgoing_caller_ids
            context.outgoing_caller_ids
          end

          ##
          # Access the queues
          # @return [queues] queues
          def queues
            context.queues
          end

          ##
          # Access the recordings
          # @return [recordings] recordings
          def recordings
            context.recordings
          end

          ##
          # Access the signing_keys
          # @return [signing_keys] signing_keys
          def signing_keys
            context.signing_keys
          end

          ##
          # Access the sip
          # @return [sip] sip
          def sip
            context.sip
          end

          ##
          # Access the short_codes
          # @return [short_codes] short_codes
          def short_codes
            context.short_codes
          end

          ##
          # Access the tokens
          # @return [tokens] tokens
          def tokens
            context.tokens
          end

          ##
          # Access the transcriptions
          # @return [transcriptions] transcriptions
          def transcriptions
            context.transcriptions
          end

          ##
          # Access the usage
          # @return [usage] usage
          def usage
            context.usage
          end

          ##
          # Access the validation_requests
          # @return [validation_requests] validation_requests
          def validation_requests
            context.validation_requests
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Api.V2010.AccountInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Api.V2010.AccountInstance #{values}>"
          end
        end
      end
    end
  end
end