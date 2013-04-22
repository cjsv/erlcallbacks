%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(yourapp_app).

-behaviour(application).
-export([start/2, stop/1]). % application required
-export([start_phase/3, prep_stop/1, config_change/3]). % application optional

%%% application required callbacks

%% invoked by
%% application:start/1
%% (application_master:start_it_old/4, application_master:start_supervisor/3)
%%
%% @doc Standard application callback. Start the application's supervisor.
%%
%% *** Change yourapp_sup below to the name of your supervisor callback
%% module. ***
%%
-spec start(StartType :: normal |
                         {takeover, Node :: node()} |
                         {failover, Node :: node()},
            StartArgs :: term()) ->
                   {ok, pid()} |
                   {ok, pid(), State :: term()} |
                   {error, Reason :: term()}.
start(_StartType, _StartArgs) ->
    yourapp_sup:start_link().

%% invoked by
%% application:stop/1
%% (application_master:loop_it/4)
%%
%% @doc Standard application callback. Stop the application.
%%
-spec stop(State :: term()) ->
                  term().
stop(_State) ->
    ok.

%%% application optional callbacks

%% invoked by
%% (application_starter:run_the_phase/4)
%%
%% @doc Standard (optional) application callback. Execute the
%% specified start phase, perhaps ensuring dependencies start in
%% order.
%%
%% *** If you don't want to use this callback, remove its name from
%% the -export list above and delete this -spec and function. ***
%%
-spec start_phase(Phase :: atom(),
                  StartType :: normal |
                               {takeover, Node :: node()} |
                               {failover, Node :: node()},
                  PhaseArgs :: term()) ->
                         ok |
                         {error, Reason :: term()}.
start_phase(_Phase, _StartType, _PhaseArgs) ->
    ok.

%% invoked by
%% application:stop/1
%% (application_master:prep_stop/2)
%%
%% @doc Standard (optional) application callback. Prepare to stop the
%% application, perhaps to persist state.
%%
%% *** If you don't want to use this callback, remove its name from
%% the -export list above and delete this -spec and function. ***
%%
-spec prep_stop(State :: term()) ->
                       NewState :: term().
prep_stop(State) ->
    State.

%% invoked by
%% (application_controller:do_config_change/2)
%%
%% @doc Standard (optional) application callback. The application's
%% configuration has changed.
%%
%% *** If you don't want to use this callback, remove its name from
%% the -export list above and delete this -spec and function. ***
%%
-spec config_change(Changed :: [{Par :: atom(), Val :: term()}],
                    New :: [{Par :: atom(), Val :: term()}],
                    Removed :: [Par :: atom()]) ->
                           ok.
config_change(_Changed, _New, _Remove) ->
    ok.

%%% functions internal to yourapp implementation
