-module(sup_bridge).

-behaviour(supervisor_bridge).
-export([init/1,terminate/2]). % required

%%% required callbacks

%% invoked by
%% supervisor_bridge:start_link
%% (supervisor_bridge:init)
%%
%% @doc Standard supervisor_bridge callback. Initial state for the
%% supervisor_bridge server process.
%%
-spec init(Args :: term()) ->
                  {ok, Pid :: pid(), State :: term()} |
                  ignore |
                  {error, Error :: term()}.
init(_Args) ->
    ignore.

%% invoked by
%% (supervisor_bridge:terminate_pid)
%%
%% @doc Standard supervisor_bridge callback. Clean up State before stopping.
%%
-spec terminate(Reason :: shutdown | term(),
                State :: term()) ->
                       Ignored :: term().
terminate(_Reason, _State) ->
    ok.

%%% functions internal to your implementation
