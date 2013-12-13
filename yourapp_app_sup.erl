% -*- mode: erlang; erlang-indent-level: 4; indent-tabs-mode: nil; fill-column: 80; comment-column: 76 -*-
-module(yourapp_app_sup).

-behaviour(application).
-behaviour(supervisor).
-export([start/2, stop/1]). % application required
-export([init/1]). % supervisor required
-export([start_phase/3, prep_stop/1, config_change/3]). % application optional
-export([start/0]). % application api
-export([start_link/0]). % supervisor api

%%% supervisor helper macro

-define(CHILD(Mod, Type),
        {Mod, {Mod, start_link, []}, permanent, 5000, Type, [Mod]}).

%%% application required callbacks

%% invoked by
%% application:start/1
%%
%% invoked indirectly by
%% application_master:start_it_old/4, application_master:start_supervisor/3
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
%%
%% invoked indirectly by
%% application_master:loop_it/4
%%
%% @doc Standard application callback.
%% Stop yourapp.
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
%% supervisor:start_link/2,3
%%
%% invoked indirectly by
%% supervisor:init/1, supervisor:code_change/3
%%
%% @doc Standard supervisor callback.
%% Specify the child processes to supervise.
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

%% If you don't want to use an optional callback, remove its name from
%% the -export list above and delete the unused -spec and function.

%% invoked indirectly by
%% application_starter:run_the_phase/4
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
%%
%% invoked indirectly by
%% application_master:prep_stop/2
%%
%% @doc Standard (optional) application callback.
%% Prepare to stop the application, persisting state if necessary.
%%
-spec prep_stop(State :: term()) ->
                       NewState :: term().
prep_stop(State) ->
    State.

%% invoked indirectly by
%% application_controller:do_config_change/2
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

%% invoked by your code
%%
%% @doc API to start yourapp. See also yourapp:start/0.
%%
-spec start() ->
                   ok |
                   {error, Reason :: term()}.
start() ->
    application:start(?MODULE).

%%% supervisor api

%% invoked by your code
%%
%% @doc API suggested in OTP Design Principles User's Guide.
%% Start this supervisor process.
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

%%% testing

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

maybe_you_should_write_a_test() ->
    ?assertEqual(
       "No, but I will!",
       "Have you written any tests?"),
    ok.

-endif.

