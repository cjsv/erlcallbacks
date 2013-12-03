%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(yourapp_app).

-behaviour(application).
-export([start/2, stop/1]). % application required
-export([start_phase/3, prep_stop/1, config_change/3]). % application optional
-export([start/0]). % application api

%%% application required callbacks

%% invoked by
%% application:start/1
%% (application_master:start_it_old/4, application_master:start_supervisor/3)
%%
%% @doc Standard application callback.
%% Start the application's supervisor.
%%
%% *** Change yourapp_sup below to the name of the yourapp supervisor
%% callback module, then remove this paragraph. ***
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
%% @doc Standard application callback.
%% Stop yourapp.
%%
-spec stop(State :: term()) ->
                  term().
stop(_State) ->
    ok.

%%% application optional callbacks

%% If you don't want to use an optional callback, remove its name from
%% the -export list above and delete the unused -spec and function.

%% invoked by
%% (application_starter:run_the_phase/4)
%%
%% @doc Standard (optional) application callback.
%% Execute the specified start phase, ensuring dependencies (if any)
%% start in order.
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
%% @doc Standard (optional) application callback.
%% Prepare to stop the application, persisting state if necessary.
%%
-spec prep_stop(State :: term()) ->
                       NewState :: term().
prep_stop(State) ->
    State.

%% invoked by
%% (application_controller:do_config_change/2)
%%
%% @doc Standard (optional) application callback.
%% The application's configuration has changed.
%%
-spec config_change(Changed :: [{Par :: atom(), Val :: term()}],
                    New :: [{Par :: atom(), Val :: term()}],
                    Removed :: [Par :: atom()]) ->
                           ok.
config_change(_Changed, _New, _Remove) ->
    ok.

%%% application api

%% invoked by you
%%
%% @doc API to start yourapp. See also yourapp:start/0.
%%
-spec start() ->
                   ok |
                   {error, Reason :: term()}.
start() ->
    application:start(?MODULE).

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

