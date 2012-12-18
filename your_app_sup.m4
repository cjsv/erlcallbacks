%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your_app_sup).changequote(<!,!>)define(AP,1)define(SU,1)

-behaviour(application).
-behaviour(supervisor).
-export([start/2, stop/1]). % application required
-export([init/1]). % supervisor required
-export([start_phase/3, prep_stop/1, config_change/3]). % application optional
-export([start/0]). % application api
-export([start_link/0]). % supervisor api

%%% supervisor helper macro

-<!define!>(CHILD(Mod, Type),
        {Mod, {Mod, start_link, []}, permanent, 5000, Type, [Mod]}).

%%% application required callbacks

include(start.fun)
include(stop.fun)
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

include(init.fun)
%%% application optional callbacks

include(start_phase.fun)
include(prep_stop.fun)
include(config_change.fun)
%%% application api

include(start0.fun)
%%% supervisor api

include(start_link.fun)
%%% functions internal to your implementation
