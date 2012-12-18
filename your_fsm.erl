%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your_fsm).

-behaviour(gen_fsm).
-export([init/1, handle_event/3, handle_sync_event/4]). % gen_fsm required
-export([handle_info/3, terminate/3, code_change/4]). % gen_fsm required
%-export([StateName/2, StateName/3]). % gen_fsm required per statename
-export([format_status/2]). % gen_fsm optional
-export([start_link/0]). % gen_fsm api

%%% gen_fsm required callbacks

-type result() ::
        {next_state, NextStateName :: atom(), NewStateData :: term()} |
        {next_state,
         NextStateName :: atom(),
         NewStateData :: term(),
         timeout() | hibernate} |
        {stop, Reason :: term(), NewStateData :: term()}.
-type sync_result() ::
        result() |
        {reply,
         Reply :: term(),
         NextStateName :: atom(),
         NewStateData :: term()} |
        {reply,
         Reply :: term(),
         NextStateName :: atom(),
         NewStateData :: term(),
         timeout() | hibernate} |
        {stop, Reason :: term(), Reply :: term(), NewStateData :: term()}.

%% invoked by
%% gen_fsm:start_link/3,4, gen_fsm:start/3,4
%% (gen_fsm:init_it/6)
%%
%% @doc Standard gen_fsm callback. Initial State for the gen_fsm
%% server process.
%%
-spec init(Args :: term()) ->
                  {ok, StateName :: atom(), StateData :: term()} |
                  {ok,
                   StateName :: atom(),
                   StateData :: term(),
                   timeout() | hibernate} |
                  {stop, Reason :: term()} |
                  ignore.
init(_Args) ->
    ignore.


%% invoked by
%% gen_fsm:send_all_state_event/2
%% (gen_fsm:dispatch/4)
%%
%% @doc Standard gen_fsm callback. A specified Event has
%% occurred. Similar to the StateName/2 functions, except that the
%% same handler is called regardless of the current state.
%%
-spec handle_event(Event :: term(),
                   StateName :: atom(),
                   StateData :: term()) ->
                          Result :: result().
handle_event(_Event, _StateName, _State) ->
    {stop, unimplemented, State}.

%% invoked by
%% gen_fsm:sync_send_all_state_event/3
%% (gen_fsm:dispatch/4)
%%
%% @doc Standard gen_fsm callback. Similar to the StateName/3
%% functions, except that the same handler is called regardless of the
%% current state.
%%
-spec handle_sync_event(Event :: term(),
                        From :: {pid(), Tag :: term()},
                        StateName :: atom(),
                        StateData :: term()) ->
                               Result :: sync_result().
handle_sync_event(_Event, _From, _StateName, State) ->
    {stop, unimplemented, State}.

%% invoked by
%% (gen_fsm:dispatch/4)
%%
%% @doc Standard gen_fsm callback. Handle non-request information.
%%
-spec handle_info(Info :: term(),
                  StateName :: atom(),
                  StateData :: term()) ->
                         Result :: result().
handle_info(_Info, _StateName, State) ->
    {stop, unimplemented, State}.

%% invoked by
%% (gen_fsm:terminate/7)
%%
%% @doc Standard gen_fsm callback. Clean up State before stopping.
%%
-spec terminate(Reason :: normal | shutdown | {shutdown, term()} | term(),
                StateName :: atom(),
                StateData :: term()) ->
                       Ignored :: term().
terminate(_Reason, _StateName, _State) ->
    ok.

%% invoked by
%% (gen_fsm:system_code_change/4)
%%
%% @doc Standard gen_fsm callback. Change State as a result of a code
%% change during release upgrade or downgrade.
%%
-spec code_change(OldVsn :: term() | {down, term()},
                  StateName :: atom(),
                  StateData :: term(),
                  Extra :: term()) ->
                         {ok, NextStateName :: atom(), NewStateData :: term()}.
code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

%% invoked by
%% gen_fsm:send_event/2
%% (gen_fsm:dispatch/4)
%%
%% Standard gen_fsm callback for each named state. When in the named
%% state, handle the specified event. No reply is expected.
%%
%% *** Before correcting the function body, copy this spec and
%% function for each named state, add the state name to the -export
%% list above, then remove this -spec and function. ***
%%
-spec StateName(Event :: timeout | term(),
                StateData :: term()) ->
                       Result :: result().
StateName(_Event, State) ->
    {stop, unimplemented, State}.

%% invoked by
%% gen_fsm:sync_send_event/2,3
%% (gen_fsm:dispatch/4)
%%
%% Standard gen_fsm callback for each named state. When in the named
%% state, handle the specified event synchronously and return a reply.
%%
%% *** Before correcting the function body, copy this spec and
%% function for each named state, add the state name to the -export
%% list above, then remove this -spec and function. ***
%%
-spec StateName(Event :: timeout | term(),
                From :: {pid(), Tag :: term()},
                StateData :: term()) ->
                       Result :: sync_result().
StateName(_Event, _From, State) ->
    {stop, unimplemented, State}.

%%% gen_fsm optional callback

%% invoked by
%% (gen_fsm:format_status/2, gen_fsm:terminate/7)
%%
%% @doc Standard (optional) gen_fsm callback. Format the process'
%% dictionary and state for output.
%%
%% *** If you want to use the default function instead of this
%% callback, remove format_status/2 from the -export list above and
%% delete this -spec and function. ***
%%
-spec format_status(Opt :: normal | terminate,
                    [{PDict :: [{Key :: atom(), Value :: term()}],
                      StateData :: term()}]) ->
                           Status :: term().
format_status(_Opt, [_PDict, StateData]) ->
    [{data, [{"StateData", StateData}]}].

%%% gen_fsm api

%% invoked by you
%%
%% @doc API suggested in OTP Design Principles User's Guide. Start
%% this gen_fsm process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()} | term()}.
start_link() ->
    gen_fsm:start_link({local, ?MODULE}, ?MODULE, [], []).

%%% functions internal to your implementation
