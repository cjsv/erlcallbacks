%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your_sup_bridge).changequote(<!,!>)define(SB,1)

-behaviour(supervisor_bridge).
-export([init/1, terminate/2]). % supervisor_bridge required

%%% supervisor_bridge required callbacks

include(init.fun)
include(terminate.fun)
%%% functions internal to your implementation
