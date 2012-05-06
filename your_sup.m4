%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your_sup).changequote(<!,!>)define(SU,1)

-behaviour(supervisor).
-export([init/1]). % required
-export([start_link/0]). % supervisor api

%%% helper macro

-<!define!>(CHILD(Mod, Type),
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

include(init.fun)
%%% supervisor api

include(start_link.fun)

%%% functions internal to your implementation
