%% -*-mode:erlang; indent-tabs-mode: nil-*-
-module(your_sup).

-behaviour(supervisor).
-export([init/1]). % required
-export([start_link/0]). % supervisor api

%%% helper macro

-define(CHILD(Mod, Type),
        {Mod, {Mod, start_link, []}, permanent, 5000, Type, [Mod]}).

%%% required callback

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

%%% supervisor api

%%
%% @doc API suggested in OTP Design Principles User's Guide to start
%% this supervisor process.
%%
-spec start_link() ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error,
                         Error :: {already_started, Pid :: pid()} |
                                  shudown |
                                  term()}.
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


%%% functions internal to your implementation
