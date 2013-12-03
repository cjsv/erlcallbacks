%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(yourapp_sup_bridge).

-behaviour(supervisor_bridge).
-export([init/1, terminate/2]). % supervisor_bridge required

%%% supervisor_bridge required callbacks

%% invoked by
%% supervisor_bridge:start_link/2,3
%% (supervisor_bridge:init/1)
%%
%% @doc Standard supervisor_bridge callback.
%% Initial state for the supervisor_bridge server process.
%%
-spec init(Args :: term()) ->
                  {ok, Pid :: pid(), State :: term()} |
                  ignore |
                  {error, Error :: term()}.
init(_Args) ->
    ignore.

%% invoked by
%% (supervisor_bridge:terminate_pid/2)
%%
%% @doc Standard supervisor_bridge callback.
%% Clean up State before stopping.
%%
-spec terminate(Reason :: shutdown | term(),
                State :: term()) ->
                       Ignored :: term().
terminate(_Reason, _State) ->
    ok.

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

