% -*- mode: erlang; erlang-indent-level: 4; indent-tabs-mode: nil; fill-column: 80; comment-column: 76 -*-
-module(yourapp_server).

-behaviour(gen_server).
-export([init/1, handle_call/3, handle_cast/2]). % gen_server required
-export([handle_info/2, terminate/2, code_change/3]). % gen_server required
%%-export([format_status/2]). % gen_server optional
-export([start_link/0]). % gen_server api

%%% gen_server required callbacks

%% invoked by
%% gen_server:start_link/3,4, gen_server:start/3,4
%%
%% invoked indirectly by
%% gen_server:init_it/6
%%
%% @doc Standard gen_server callback.
%% Initial state for the gen_server server process.
%%
-spec init(Args :: term()) ->
                  {ok, State :: term()} |
                  {ok, State :: term(), timeout() | hibernate} |
                  {stop, Reason :: term()} |
                  ignore.
init(Args) ->
    {ok, Args}.

%% invoked by
%% gen_server:call/2,3, gen_server:multi_call/2,3,4
%%
%% invoked indirectly by
%% gen_server:handle_msg5/6
%%
%% @doc Standard gen_server callback.
%% Handle synchronous requests.
%%
-spec handle_call(Request :: term(),
                  From :: {pid(), Tag :: term()},
                  State :: term()) ->
                         {reply, Reply :: term(), NewState :: term()} |
                         {reply,
                          Reply :: term(),
                          NewState :: term(),
                          timeout() | hibernate} |
                         {noreply, NewState :: term()} |
                         {noreply, NewState :: term(), timeout() | hibernate} |
                         {stop,
                          Reason :: term(),
                          Reply :: term(),
                          NewState :: term()} |
                         {stop, Reason :: term(), NewState :: term()}.
handle_call(_Request, _From, State) ->
    {noreply, State}.

%% invoked by
%% gen_server:cast/2, gen_server:abcast/2
%%
%% invoked indirectly by
%% gen_server:dispatch/3
%%
%% @doc Standard gen_server callback.
%% Handle a request not requiring a reply.
%%
-spec handle_cast(Request :: term(),
                  State :: term()) ->
                         {noreply, NewState :: term()} |
                         {noreply, NewState :: term(), timeout() | hibernate} |
                         {stop, Reason :: term(), NewState :: term()}.
handle_cast(_Request, State) ->
    {noreply, State}.

%% invoked indirectly by
%% gen_server:dispatch/3
%%
%% @doc Standard gen_server callback.
%% Handle non-request information.
%%
-spec handle_info(Info :: timeout() | term(), State :: term()) ->
                         {noreply, NewState :: term()} |
                         {noreply, NewState :: term(), timeout() | hibernate} |
                         {stop, Reason :: term(), NewState :: term()}.
handle_info(_Info, State) ->
    {noreply, State}.

%% invoked indirectly by
%% gen_server:terminate/6
%%
%% @doc Standard gen_server callback.
%% Clean up State before stopping.
%%
-spec terminate(Reason :: normal | shutdown | {shutdown, term()} | term(),
                State :: term()) ->
                       Ignored :: term().
terminate(_Reason, _State) ->
    ok.

%% invoked indirectly by
%% gen_server:system_code_change/4
%%
%% @doc Standard gen_server callback.
%% Change State as a result of a code change during release upgrade or
%% downgrade.
%%
-spec code_change(OldVsn :: (term() | {down, term()}),
                  State :: term(),
                  Extra :: term()) ->
                         {ok, NewState :: term()} |
                         {error, Reason :: term()}.
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%% gen_server optional callback

%% If you want to use the default format_status/2 function instead of
%% providing your own here, remove format_status/2 from the -export
%% list above and delete this -spec and function.

%% invoked indirectly by
%% gen_server:format_status/2, gen_server:terminate/6
%%
%% @doc Standard (optional) gen_server callback.
%% Format the process' dictionary and state for output.
%%
-spec format_status(Opt :: normal | terminate,
                    [{PDict :: [{Key :: atom(), Value :: term()}],
                      State :: term()}]) ->
                           Status :: term().
format_status(_Opt, [_PDict, State]) ->
    [{data, [{"State", State}]}].

%%% gen_server api

%% invoked by your code
%%
%% @doc API suggested in OTP Design Principles User's Guide.
%% Start this gen_server process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()} | term()}.
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

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

