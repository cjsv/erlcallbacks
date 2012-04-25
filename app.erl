-module(app).

-behaviour(application).
-export([start/2,stop/1]). % required
-export([start_phase/3,prep_stop/1,config_change/3]). % optional

%% required callbacks

-type start_type() :: normal
                    | {takeover, Node :: node()}
                    | {failover, Node :: node()}.

% invoked by
% application:start
% (application_master:start_it_old,application_master:start_supervisor)
%
-spec start(StartType :: start_type(), StartArgs :: term()) ->
    {ok, pid()} | {ok, pid(), State :: term()} | {error, Reason :: term()}.
%
start(_StartType, _StartArgs) ->
    sup:start_link().

% invoked by
% application:stop
% (application_master:loop_it)
%
-spec stop(State :: term()) -> term().
%
stop(_State) -> ok.

%% optional callbacks

% invoked by
% (application_starter:run_the_phase)
%
-spec start_phase(Phase :: atom(), StartType :: start_type(), PhaseArgs :: term()) -> ok | {error, Reason :: term()}.
%
start_phase(_Phase, _StartType, _PhaseArgs) -> ok.

% invoked by
% application:stop
% (application_master:prep_stop)
%
-spec prep_stop(State :: term()) -> NewState :: term().
%
prep_stop(State) -> State.

% invoked by
% (application_controller:do_config_change)
%
-spec config_change(Changed :: [{Par :: atom(), Val :: term()}], New :: [{Par :: atom(), Val :: term()}], Removed :: [Par :: atom()]) -> ok.
%
config_change(_Changed, _New, _Remove) -> ok.

%% implementation
