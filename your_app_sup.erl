%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your_app_sup).

-behaviour(application).
-behaviour(supervisor).
-export([start/2,stop/1]). % application required
-export([init/1]). % supervisor required
-export([start_phase/3,prep_stop/1,config_change/3]). % application optional
-export([start/0]). % application api
-export([start_link/0]). % supervisor api

%%% supervisor helper macro

-define(CHILD(Mod, Type),
        {Mod, {Mod, start_link, []}, permanent, 5000, Type, [Mod]}).

%%% application required callbacks

%% invoked by
%% application:start
%% (application_master:start_it_old,application_master:start_supervisor)
%%
%% @doc Standard application callback. Start the application's supervisor.
%%
%% *** Change your_sup below to the name of your supervisor callback
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
    your_sup:start_link().

%% invoked by
%% application:stop
%% (application_master:loop_it)
%%
%% @doc Standard application callback. Stop the application.
%%
-spec stop(State :: term()) ->
                  term().
stop(_State) ->
    ok.

%%% supervisor required callback

-type child_id() :: term().
-type mfargs()   :: {M :: module(), F :: atom(), A :: [term()] | undefined}.
-type modules()  :: [module()] | dynamic.
-type restart()  :: permanent | transient | temporary.
-type shutdown() :: brutal_kill | timeout().
-type worker()   :: worker | supervisor.
-type child_spec() :: {Id :: child_id(),
                       StartFunc :: mfargs(),
                       Restart :: restart(),
                       Shutdown :: shutdown(),
                       Type :: worker(),
                       Modules :: modules()}.
-type strategy() :: one_for_all |
                    one_for_one |
                    rest_for_one |
                    simple_one_for_one.

%% invoked by
%% supervisor:start_link
%% (supervisor:init,supervisor:code_change)
%%
%% @doc Standard supervisor callback. Specify the child processes to
%% supervise.
%%
-spec init(Args :: term()) ->
                  {ok, {{RestartStrategy :: strategy(),
                         MaxR :: non_neg_integer(),
                         MaxT :: non_neg_integer()},
                        [ChildSpec :: child_spec()]}} |
                  ignore.
init(_Args) ->
    {ok, {{one_for_one, 5, 10}, []}}.

%%% application optional callbacks

%% invoked by
%% (application_starter:run_the_phase)
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
%% application:stop
%% (application_master:prep_stop)
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
%% (application_controller:do_config_change)
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

%%% application api

%%
%% @doc API to start application.
%%
-spec start() ->
                   ok |
                   {error, Reason :: term()}.
start() ->
    application:start(?MODULE).

%%% supervisor api

%%
%% @doc API suggested in OTP Design Principles User's Guide. Start
%% this supervisor process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()} |
                                  shutdown |
                                  term()}.
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%%% functions internal to your implementation
