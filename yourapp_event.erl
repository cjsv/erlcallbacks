% -*- mode: erlang; erlang-indent-level: 4; indent-tabs-mode: nil; fill-column: 80; comment-column: 76 -*-
-module(yourapp_event).

-behaviour(gen_event).
-export([init/1, handle_event/2, handle_call/2]). % gen_event required
-export([handle_info/2, terminate/2, code_change/3]). % gen_event required
-export([format_status/2]). % gen_event optional
-export([start_link/0]). % gen_event api

%%% gen_event required callbacks

%% invoked by
%% gen_event:add_handler/3, gen_event:add_sup_handler/3,
%% gen_event:swap_handler/3, gen_event:swap_sup_handler/3
%%
%% invoked indirectly by
%% gen_event:server_add_handler/3, gen_event:do_swap/7
%%
%% @doc Standard gen_event callback.
%% Initial State for the gen_event server process.
%%
-spec init(InitArgs :: term()) ->
                  {ok, State :: term()} |
                  {ok, State :: term(), hibernate} |
                  {error, Reason :: term()}.
init(_Args) ->
    {ok, nostate}.

%% invoked by
%% gen_event:notify/2, gen_event:sync_notify/2
%%
%% @doc Standard gen_event callback.
%% A specified Event has occurred.
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
%% gen_event:call/3,4
%%
%% invoked indirectly by
%% gen_event:server_call_update/3
%%
%% @doc Standard gen_event callback.
%% Handle synchronous requests.
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

%% invoked indirectly by
%% gen_event:server_notify/4
%%
%% @doc Standard gen_event callback.
%% Handle non-event information.
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
%% gen_event:delete_handler/3, gen_event:stop/1
%% gen_event:swap_handler/3, gen_event:swap_sup_handler/3
%%
%% invoked indirectly by
%% gen_event:do_terminate/7
%%
%% @doc Standard gen_event callback.
%% Clean up State before stopping.
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

%% invoked indirectly by
%% gen_event:system_code_change/4
%%
%% @doc Standard gen_event callback.
%% Change State as a result of a code change during release upgrade or
%% downgrade.
%%
-spec code_change(OldVsn :: (term() | {down, term()}),
                  State :: term(),
                  Extra :: term()) ->
                         {ok, NewState :: term()}.
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%% gen_event optional callback

%% If you want to use the default format_status/2 function instead of
%% providing your own here, remove format_status/2 from the -export
%% list above and delete this -spec and function.

%% invoked indirectly by
%% gen_event:format_status/2, gen_event:report_error/5
%%
%% @doc Standard (optional) gen_event callback.
%% Format the process' dictionary and state for output.
%%
-spec format_status(Opt :: normal | terminate,
                    [{PDict :: [{Key :: atom(), Value :: term()}],
                      State :: term()}]) ->
                           Status :: term().
format_status(_Opt, [_PDict, State]) ->
    [{data, [{"State", State}]}].

%%% gen_event api

%% invoked by your code
%%
%% @doc API suggested in OTP Design Principles User's Guide.
%% Start this gen_event process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()}.
start_link() ->
    gen_event:start_link({local, ?MODULE}, ?MODULE, [], []).

%%% functions internal to your implementation

%%% testing

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

maybe_you_should_write_a_test() ->
    ?assertEqual(
       "No, but I will!",
       "Have you written any tests?"),
    ok.

-endif.

