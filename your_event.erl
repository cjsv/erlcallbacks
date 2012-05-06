%% -*-mode:erlang; indent-tabs-mode: nil-*-
-module(your_event).

-behaviour(gen_event).
-export([init/1,handle_event/2,handle_call/2,handle_info/2]). % required
-export([erminate/2,code_change/3]). % required
-export([format_status/2]). % optional
-export([start_link/0]). % gen_event api

%%% required callbacks

%% invoked by
%% gen_event:add_handler, gen_event:add_sup_handler
%% gen_event:swap_handler, gen_event:swap_sup_handler
%% (gen_event:server_add_handler, gen_event:do_swap)
%%
%% @doc Standard gen_event callback. Initial State for the gen_event
%% server process.
%%
-spec init(InitArgs :: term()) ->
                  {ok, State :: term()} |
                  {ok, State :: term(), hibernate} |
                  {error, Reason :: term()}.
init(_Args) ->
    {ok, nostate}.

%% invoked by
%% gen_event:notify, gen_event:sync_notify
%%
%% @doc Standard gen_event callback. A specified Event has occurred.
%%
-spec handle_event(Event :: term(),
                   State :: term()) ->
                          {ok, NewState :: term()} |
                          {ok, NewState :: term(), hibernate} |
                          {swap_handler,
                           Args1 :: term(),
                           NewState :: term(),
                           Handler2 :: atom() | {atom(), Id :: term()},
                           Args2 :: term()} |
                          remove_handler.
handle_event(_Event, State) ->
    {ok, State}.

%% invoked by
%% gen_event:call
%% (gen_event:server_call_update)
%%
%% @doc Standard gen_event callback. Handle synchronous requests.
%%
-spec handle_call(Request :: term(),
                  State :: term()) ->
                         {ok, Reply :: term(), NewState :: term()} |
                         {ok, Reply :: term(), NewState :: term(), hibernate} |
                         {swap_handler,
                          Reply :: term(),
                          Args1 :: term(),
                          NewState :: term(),
                          Handler2 :: atom() | {atom(), Id :: term()},
                          Args2 :: term()} |
                         {remove_handler, Reply :: term()}.
handle_call(_Request, State) ->
    {ok, reply, State}.

%% invoked by
%%
%% @doc Standard gen_event callback. Handle non-event information.
%%
-spec handle_info(Info :: term(), State :: term()) ->
                         {ok, NewState :: term()} |
                         {ok, NewState :: term(), hibernate} |
                         {swap_handler,
                          Args1 :: term(),
                          NewState :: term(),
                          Handler2 :: atom() | {atom(), Id :: term()},
                          Args2 :: term()} |
                         remove_handler.
handle_info(_Info, State) ->
    {ok, State}.

%% invoked by
%% gen_event:delete_handler, gen_event:stop
%% gen_event:swap_handler, gen_event:swap_sup_handler
%% (gen_event:do_terminate)
%%
%% @doc Standard gen_event callback. Clean up State before stopping.
%%
-spec terminate(Args :: term() |
                        {stop, Reason :: term()} |
                        stop |
                        remove_handler |
                        {error, {'EXIT', Reason :: term()}} |
                        {error, term()},
                State :: term()) ->
                       Ignored :: term().
terminate(_Args, _State) ->
    ok.

%% invoked by
%% (gen_event:system_code_change)
%%
%% @doc Standard gen_event callback. Change State as a result of a code
%% change during release upgrade or downgrade.
%%
-spec code_change(OldVsn :: (term() | {down, term()}),
                  State :: term(),
                  Extra :: term()) ->
                         {ok, NewState :: term()}.
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%% optional callback

%% invoked by
%% (gen_event:format_status,gen_event:report_error)
%%
%% @doc Standard (optional) gen_event callback. Format the process'
%% dictionary and state for output.
%%
%% *** If you want to use the default function instead of this
%% callback, remove format_status/2 from the -export list above and
%% delete this -spec and function. ***
%%
-spec format_status(Opt :: normal | terminate,
                    [{PDict :: [{Key :: atom(), Value :: term()}],
                      State :: term()}]) ->
                           Status :: term().
format_status(_Opt, [_PDict, State]) ->
    [{data, [{"State", State}]}].

%%% gen_event api

%%
%% @doc API suggested in OTP Design Principles User's Guide to start
%% this gen_event process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()}.
start_link() ->
    gen_event:start_link({local, ?MODULE}, ?MODULE, [], []).

%%% functions internal to your implementation
